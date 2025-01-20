function [pBitsRx, err, delay, frequencyOffset, channelEst, ...
    psduSizeRx, messageDurationRx, blockSizeRx, ...
    fecRateRx, repetitionNumberRx, fecConcatenationFactorRx, ...
    scramblerInitializationRx, batIdRx, cyclicPrefixIdRx, ...
    explicitMimoPilotSymbolCombSpacingRx, ...
    explicitMimoPilotSymbolNumberRx, ...
    hRxLLR, pRxLLR] = fullRx(CONST, OFDMSignal, carrierFrequencyOffset, errorQtty)
%FULLRX Full Rx implementation. Returns the payload bits, and the header
% parameters. If "err == 1", then the header was read with some errors.
arguments(Input)
    CONST
    OFDMSignal (:, 1) double
    carrierFrequencyOffset double = 0
    errorQtty double = 0
end
arguments(Output)
    pBitsRx (:, 1) logical
    err logical
    delay double
    frequencyOffset double
    channelEst double
    psduSizeRx (24, 1) logical
    messageDurationRx (16, 1) logical
    blockSizeRx (2, 1) logical
    fecRateRx (3, 1) logical
    repetitionNumberRx (3, 1) logical
    fecConcatenationFactorRx (3, 1) logical
    scramblerInitializationRx (4, 1) logical
    batIdRx (5,1) logical
    cyclicPrefixIdRx (3, 1) logical
    explicitMimoPilotSymbolCombSpacingRx (3, 1) logical
    explicitMimoPilotSymbolNumberRx (3, 1) logical
    hRxLLR (:,:) double
    pRxLLR (:,:) double
end
    %% Prepare OFDM samples to be demodulated
    OFDMRxRaw = downshifter(CONST, OFDMSignal, carrierFrequencyOffset);
    %OFDMRxRaw = rxInterpolator(CONST, OFDMRxRaw);
    OFDMRxRaw = rxDecimator(CONST, OFDMRxRaw);

    [~, delay, ~, ~, frequencyOffset] = ofdmSymbolSync(CONST, OFDMRxRaw);

    %% Correct CFO
    % Demodulate the rest of the OFDM symbol, but knowing the frequency
    % offset
    p = CONST.rxM;
    OFDMRx = OFDMSignal(1 + round((delay + CONST.preambleOFDMSamples)*p):end);
    OFDMRx = downshifter(CONST, OFDMRx, carrierFrequencyOffset +frequencyOffset);
    %OFDMRx = rxInterpolator(CONST, OFDMRx);
    OFDMRx = rxDecimator(CONST, OFDMRx);

    %% Estimate channel
    [OFDMRx, channelEst] = ofdmChannelEstimation(CONST, OFDMRx);

    %% Process header
    headerRx = OFDMRx(1:CONST.headerOFDMSamples);
    headerRxLLR = ofdmDemodulate(CONST, headerRx, ...
        CONST.headerBitsPerSubcarrier, CONST.headerCyclicPrefixLen, ...
        CONST.headerScramblerInit, true, channelEst);
    hRxLLR = headerRemoveRepetition(CONST, headerRxLLR);
    hScrambledRx = LDPCDecoder(CONST, hRxLLR, 0, 0, true);
    hGenRx = headerScrambler(CONST, hScrambledRx);
    [err, psduSizeRx, messageDurationRx, blockSizeRx, ...
        fecRateRx, repetitionNumberRx, fecConcatenationFactorRx, ...
        scramblerInitializationRx, batIdRx, cyclicPrefixIdRx, ...
        explicitMimoPilotSymbolCombSpacingRx, ...
        explicitMimoPilotSymbolNumberRx] = headerSeparate(CONST, hGenRx);
    
    %% Estimate payload parameters from header
    payloadBitsPerSubcarrierRx = binl2dec(batIdRx);
    payloadCyclicPrefixLenRx = binl2dec(cyclicPrefixIdRx) * CONST.N / 32;

    if (err == true)
        warning("Header was not read correctly");
        pBitsRx = [];
        pRxLLR = [];
        return
    end
    
    %% Process payload
    % Remove the excess timingWindow added and the header samples
    payloadRx = OFDMRx(1+CONST.headerOFDMSamples:end);
    excessPayloadSamples = mod(length(payloadRx),CONST.N+payloadCyclicPrefixLenRx);
    payloadRx = payloadRx(1:end-excessPayloadSamples);

    if (isempty(payloadRx))
        pBitsRx = [];
        pRxLLR = [];
        return
    end

    payloadRxLLR = ofdmDemodulate(CONST, payloadRx, ...
        payloadBitsPerSubcarrierRx, payloadCyclicPrefixLenRx, ...
        CONST.payloadScramblerInit, true, channelEst);
    pRxLLR = removeToneMapping(CONST, payloadRxLLR, psduSizeRx);

    % Knowing the full size of the signal, reshape it to fit in the LDPC
    % decoder
    pRxLLR = reshape(pRxLLR, CONST.payloadBitsPerFec, []);
    payloadLenInFecBlocks = width(pRxLLR);
    
    pBitsRx = false(CONST.payloadBitsPerBlock0, payloadLenInFecBlocks);
    for i=1:1:payloadLenInFecBlocks
        if (errorQtty ~= 0)
            % Inject errors before LDPC decoder
            pRxLLR(1:errorQtty+1, i) = 0;
        end
        pScrambledRx = LDPCDecoder(CONST, pRxLLR(:,i), binl2dec(fecRateRx), binl2dec(blockSizeRx), false);
        pBitsRx(:,i) = payloadScrambler(CONST, scramblerInitializationRx, pScrambledRx);
    end
    pBitsRx = pBitsRx(:);

    % Remove excess bits, which were added to make the message be a
    % multiple of the fecBlockSize.
    payloadBitsExtra = binl2dec(messageDurationRx)*8;
    pBitsRx = pBitsRx(1:end-payloadBitsExtra, 1);
end


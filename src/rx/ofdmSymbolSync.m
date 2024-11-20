function [ofdmSynched, delay, M, peaks, frequencyOffset] = ofdmSymbolSync(CONST, ofdmIn)
%OFDMSYMBOLSYNC Synchronize OFDM symbols using the Cox and Schmidl method.
% Both time synchronization and the CFO (carrier frequency offset) are
% calculated. Returns the ofdm signal with the delay and preamble removed.
%
% The CFO is based on the Cox paper, and assumes that the phase delay
% is less than pi (a phase delay less than "pi", is equal to a frequency
% delay less than "1/T", where "T" is the time duration of the message.
% For IEEE 802.15.13, "T is equal to the first 10 preamble symbols",
% therefore:
% Max delta frequency = 1/T = fsc / 10 = 50M/256 / 10 = 19.5 kHz.
% Considering that, by standard, the oscillators precision is:
% aPhyClockAccuracy = +- 50ppm, and the clock runs at 50MHz:
% Max frequency ofset = 2*100u*50MHz = 10kHz, which is lower than the
% maximum 19.5 kHz.
% 
% Note: "M" function from the Cox paper and "S" function from the peak
% detection function are almost the same. Therefore, simply "M" is used.
arguments(Input)
    CONST
    ofdmIn (:,1) double
end
arguments(Output)
    ofdmSynched (:,1) double
    delay double
    M (:,1) double
    peaks (:,1) double
    frequencyOffset
end
    % For the symbol, we will use the first ten repetitions of the OFDM
    % preamble
    L = CONST.preambleFirstPartOFDMSamples/2; % Length of the training symbol (half of the ten preamble symbols)
    M = zeros(length(ofdmIn)-2*L, 1);
    P = zeros(length(ofdmIn)-2*L, 1);

    for d=1:1:length(ofdmIn)-2*L
        firstSymbol = ofdmIn(d+1:d+L);
        secondSymbol = ofdmIn(d+L+1:d+2*L);
        bothSymbols = [firstSymbol; secondSymbol];
    
        P(d) = sum(conj(firstSymbol).*secondSymbol);
        Rf = 1/2 * sum((abs(bothSymbols)).^2);
    
        M(d) = abs(P(d))^2 / Rf^2;
    end

    % Same as searching for the "max" of the function "M"
    %[~, delay] = max(M);
    peaks = rawPeakDetection(M, CONST.peakDetectorWindow, CONST.peakDetectorThreshold);
    if (~isempty(peaks))
        delay = peaks(1);
        peaks = peaks(1);
    else
        delay = 1;
    end

    % Calculate frequency offset
    deltaPhase = angle(P(delay));
    frequencyOffset = deltaPhase / (pi*CONST.frequencyOffsetTimeWindow);

    if (delay == 1)
        % Fix a bug where, if no delay is applied, is considered as a "1 symbol" delay.
        delay = 0;
        peaks(1) = 0;
    end

    % Remove delay and preamble
    ofdmSynched = ofdmIn(1+delay+CONST.preambleOFDMSamples:end);
end


function header = headerGenerate(psduSize, messageDuration, blockSize, ...
    fecRate, repetitionNumber, fecConcatenationFactor, ...
    scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber)
%HEADERGENERATE Generate a header for the IEEE 802.15.13-2023 HB-PHY.
% The header returned is in transmit order, with big-endianess for 
% multi-byte elements and LSB first bit ordering.
% Args:
%   - psduSize = Size of the coded and modulated payload in octets (24 bits).
% Outputs:
%   - header = Header in transmit order.
arguments(Input)
    psduSize uint32 {mustBeLessThan(psduSize, 16777215)}
    messageDuration double {mustBeLessThan(messageDuration, 16.38375e-3)}
    blockSize (2, 1) logical
    fecRate (3, 1) logical
    repetitionNumber (3, 1) logical
    fecConcatenationFactor (3, 1) logical
    scramblerInitialization (4, 1) logical
    batId (5,1) logical
    cyclicPrefixId (3, 1) logical
    explicitMimoPilotSymbolCombSpacing (3, 1) logical
    explicitMimoPilotSymbolNumber (3, 1) logical
end
arguments(Output)
    header (1, 168) logical
end

    %%% Operations to transform input arguments
    messageDuration = floor(messageDuration / 0.25e-6);
    
    %%% Prepare header fields in transmit order.
    frameType = binl2tx(logical([1 1 0 0]));
    frameSubType = binl2tx(logical([0 0 0 0]));
    psduSize = dec2tx(psduSize, 24);
    messageDuration = dec2tx(messageDuration, 16);
    blockSize = binl2tx(blockSize);
    fecRate = binl2tx(fecRate);
    repetitionNumber = binl2tx(repetitionNumber);
    fecConcatenationFactor = binl2tx(fecConcatenationFactor);
    scramblerInitialization = binl2tx(scramblerInitialization);
    reserved63 = false;
    batId = dec2tx(batId);
    reserved69 = binl2tx(logical([0 0 0]));
    cyclicPrefixId = binl2tx(cyclicPrefixId);
    explicitMimoPilotSymbolCombSpacing = binl2tx(explicitMimoPilotSymbolCombSpacing);
    reserved78 = dec2tx(0, 28);
    explicitMimoPilotSymbolNumber = binl2tx(explicitMimoPilotSymbolNumber);
    reserved109 = dec2tx(0, 43);
    
    % Form the first 151 header elements
    header = [frameType; frameSubType; psduSize; messageDuration; blockSize;
        fecRate; repetitionNumber; fecConcatenationFactor; scramblerInitialization;
        reserved63; batId; reserved69; cyclicPrefixId; explicitMimoPilotSymbolCombSpacing;
        reserved78; explicitMimoPilotSymbolNumber; reserved109];
    
    % Apply CRC
    header = crcGenerate(logical([1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 1]), header);
    
end
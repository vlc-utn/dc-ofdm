%% Parameters
% These variables can change between PSDUs
constants;

%% Payload
% Define payload length
payloadLenInFecBlocks = 5;
payloadLenInBits = payloadLenInFecBlocks*CONST.payloadBitsPerBlock0;
payloadLenInWords = payloadLenInBits/CONST.axiWidth;

%% Header formation
% All these variables are required to form the header. A more detailed
% explanation of each parameter can be found on the standard.

% Length of the payload, in octets
psduSize = dec2binl(payloadLenInWords, 24)';

% TODO: add the size of the payload, which should be inferred from the rest
% of the header values.
%messageDuration = (preambleDuration + channelDuration + headerDuration); 
messageDuration = logical([ ...
    0 0 0 0 0 0 0 0 ...
    0 0 0 0 0 0 0 0]);

% The size of the FEC encoded keyword
% 0b00 = 960 bits or 0b01 = 4320 bits
blockSize = logical([0 0]);

% 0b001 = 1/2; 0b010 = 2/3; 0b011 = 5/6; 0b100 = 16/18; 0b101 = 20/21
fecRate = logical([0 0 1]);

% How many times the payload is repeated
% 0b001 = 1; 0b010 = 2; 0b011 = 3; 0b100 = 4; 0b101 = 6; 0b110 = 8
repetitionNumber = logical([0 0 1]);

fecConcatenationFactor = logical([0 0 0]); % TODO

% First four bits of the payload constellation scrambler
scramblerInitialization = logical([1 1 1 1]);

% batID determines the amount of bits allocated per subcarrier
batId = logical([0 0 0 1 0]);

% Number of samples for the cyclic prefix. Ncp = k* N /32. 3 bits max
cyclicPrefixId = logical([0 0 1]);

% MIMO not supported
explicitMimoPilotSymbolCombSpacing = logical([0 0 0]);
explicitMimoPilotSymbolNumber = logical([0 0 0]);

%% Calculated parameters for the payload
payloadBitsPerSubcarrier = binl2dec(batId);
payloadCyclicPrefixLen = binl2dec(cyclicPrefixId) * CONST.N / 32;

payloadBitsPerOFDMSymbol = CONST.numDataCarriers*binl2dec(batId);

% Note: the "*2" is beacuse of the fec rate of 1/2.
payloadNumOFDMSymbols = binl2dec(psduSize)*CONST.axiWidth*2 / payloadBitsPerOFDMSymbol;
payloadNumOFDMSamples = (payloadCyclicPrefixLen + CONST.N)*payloadNumOFDMSymbols;

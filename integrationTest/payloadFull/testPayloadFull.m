%% Test payload full implementation, with:
% - Payload generation from registers.
% - Input data simulating an AXI4 Stream FIFO, with TVALID and TREADY
% signals.
% - Payload scrambler.
% - Payload LDPC encoder.
% - Payload Puncturer (not supported).
% - Payload repetition (not supported).
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Input
paramFile = "sampleParametersFile";
%msgIn{1} = ['This is an example message used to test the transmitter. ' ...
%    'It is made large on purpose to test for a large message being ' ...
%    'transmitted'];
%msgIn{2} = 'This is a second message';
%msgIn{3} = 'This is a third message';
msgIn{1} = randomStr(4096);

pWords = [];
validIn = [];
for i=1:1:length(msgIn)
    pBitsRaw{i} = str2binl(msgIn{i});
    pBitsRaw{i} = getPayloadParamsFromBits(CONST, pBitsRaw{i});
    pWords = [pWords binl2str(pBitsRaw{i})];
    len = length(binl2str(pBitsRaw{i}));
    validIn = [validIn; true(len, 1);];
end

newFrame = true;

%% Expected Output Payload
expectedOut = cell(length(msgIn), 1);
scramblerInitLSB = zeros(4, 1, length(msgIn)+1);
fecRateLSB = zeros(3, 1, length(msgIn)+1);
blockSizeLSB = zeros(2, 1, length(msgIn)+1);
batIdLSB = zeros(5, 1, length(msgIn)+1);
psduSizeLSB = zeros(24, 1, length(msgIn)+1);
repNumberLSB = zeros(3, 1, length(msgIn)+1);

for j=1:1:length(msgIn)
    % Update header parameters and set in tx order
    pBits = binl2tx(pBitsRaw{j});
    run(paramFile);
    scramblerInitLSB(:,1, j) = flip(scramblerInitialization);
    fecRateLSB(:,1, j) = flip(fecRate);
    blockSizeLSB(:,1, j) = flip(blockSize);
    batIdLSB(:,1, j) = flip(batId);
    psduSizeLSB(:,1, j) = flip(psduSize);
    repNumberLSB(:,1, j) = flip(repetitionNumber);

    pBits = reshape(pBits, CONST.payloadBitsPerBlock0, payloadLenInFecBlocks);
    pLDPC = false(CONST.payloadBitsPerFec, payloadLenInFecBlocks);
    for i=1:1:payloadLenInFecBlocks
        pScrambled = payloadScrambler(CONST, scramblerInitialization, pBits(:,i));
        pLDPC(:,i) = LDPCEncoder(CONST, pScrambled, binl2dec(fecRate), binl2dec(blockSize), false);
    end
    pLDPC = pLDPC(:);
    payloadOFDMSymbols = toneMapping(CONST, pLDPC, binl2dec(batId));
    expectedOut{j} = payloadOFDMSymbols(:);
end


%% Simulation Time
latency = 1000000/CONST.fs;             % Algorithm latency. Delay between input and output
stopTime = (length(pWords)-1)/CONST.fs + latency;

%% Run the simulation
model_name = "HDLPayloadFull";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

%% Actual test
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(~isempty(startIdx), ...
    "StartIdx shouldn't be empty");
assert(isequal(length(startIdx), length(endIdx)), ...
    "Start and end should be of the same size");
assert(isequal(length(startIdx), length(msgIn)), ...
    "Messages and start indexes should be the same number");

for i=1:1:length(msgIn)
    out = dataOut(startIdx(i):endIdx(i));
    valid = validOut(startIdx(i):endIdx(i));
    out = out(valid == true);
    assert(isequal(expectedOut{i}, out));
end

disp("Test successfull!");

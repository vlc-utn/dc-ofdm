%% Test Rx Payload
clc; clear; close all;
addpath("../../src");
addpath("../../src/rx");
addpath("../../inc");
constants;

%% Inputs
paramFile = "sampleParametersFile";

% The inputs from Simulink are read in a special manner:
% Because of the "remove tone mapping", an extra "ready" signal is sent,
% but no new payload data is sent to the LDPC block. Therefore, if you
% store serially all the data for the payload, you should consider this
% "extra" symbols.
% The solution is to create different inputs in Simulink, that are called
% for each individual message.
msgIn{1} = ['Sample message to test the payload, made large to have more ' ...
    'than one fec block in bits as size. Something more to say? Well, ' ...
    'this project has taken a lot of time, and Im tired. I hope that, at ' ...
    'the end, the odyssey had a purpose (puts a cigarrete on his mouth and ' ...
    'epic music starts fading in from the background'];
msgIn{2} = 'Next message';
msgIn{3} = 'Third is a charm!';
msgQtty = length(msgIn);

dataSizes = zeros(msgQtty, 1);
for i=1:1:msgQtty
    dataSizes(i) = length(msgIn{i});
end
dataSizes = sum(dataSizes);

% Preallocation
scramblerInitLSB = false(4,1,msgQtty+1);
fecRateLSB = false(3,1,msgQtty+1);
blockSizeLSB = false(2,1,msgQtty+1);
batIdLSB = false(5,1, msgQtty+1);
psduSizeLSB = false(24,1,msgQtty+1);
msgDurationLSB = false(16,1,msgQtty+1);
simPayloadExtraWords = zeros(msgQtty, 1);
simPayloadLenInFecBlocks = zeros(msgQtty, 1);
payloadRxLLR = cell(msgQtty);
validIn = cell(msgQtty);
newFrame = [];

% Prepare received payloads
for i=1:1:msgQtty
    pBits = str2binl(msgIn{i});
    pBits = binl2tx(pBits);     % Transmitted symbols should be LSB first
        
    % Make LSB first parameters for the HDL block
    run(paramFile);
    scramblerInitLSB(:, 1, i) = flip(scramblerInitialization);
    fecRateLSB(:, 1, i) = flip(fecRate);
    blockSizeLSB(:, 1, i) = flip(blockSize);
    batIdLSB(:, 1, i) = flip(batId);
    psduSizeLSB(:, 1, i) = flip(psduSize);
    msgDurationLSB(:, 1, i) = flip(messageDuration);
    
    [~, simPayloadExtraWords(i, 1), payloadOFDMSymbols] = ...
        fullTx(CONST, paramFile, pBits, 0, false);
    
    payloadTx = ofdmModulate(CONST, payloadOFDMSymbols, ...
        payloadBitsPerSubcarrier, payloadCyclicPrefixLen, ...
        CONST.payloadScramblerInit);
    payloadRxLLR{i} = ofdmDemodulate(CONST, payloadTx, ...
        payloadBitsPerSubcarrier, payloadCyclicPrefixLen, ...
        CONST.payloadScramblerInit, true);
    
    validIn{i} = true(size(payloadRxLLR{i}));
    newFrame = [newFrame; true; false(length(payloadRxLLR{i})-1, 1); false(50000, 1)];
end


%% Simulation Time
latency = 500000/CONST.fPHY;         % Algorithm latency. Delay between input and output
stopTime = (length(payloadRxLLR)-1)/CONST.fPHY + latency;

%% Run the simulation
model_name = "HDLRxPayload";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

%% Test values
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(~isempty(startIdx), ...
    "StartIdx shouldn't be empty");
assert(isequal(length(startIdx), length(endIdx)), ...
    "Start and end should be of the same size");

msg = "";
for i=1:1:msgQtty
    msg = append(msg, msgIn{i});
end
out = dataOut(startIdx:endIdx);
valid = validOut(startIdx:endIdx);
out = out(valid == 1);
msgOut = char(out)';
assert(isequal(msgOut, msg), "Sent and received message should be the same!");

disp("Test successfull!");



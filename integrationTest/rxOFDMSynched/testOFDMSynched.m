%% Test Rx OFDM Syncheed
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
addpath("../../src/rx");
constants;
parameters;

%% Inputsdata_in_demod_tb
createVivadoFile = true;

%% Header
hGen = headerGenerate(CONST, psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
hScrambled = headerScrambler(CONST, hGen);
hLDPC = LDPCEncoder(CONST, hScrambled, 0, 0, true);
headerOFDMSymbols = headerRepetitionEncoder(CONST, hLDPC);

%% Payload
pBits = logical(randi([0,1], CONST.payloadBitsPerBlock0, payloadLenInFecBlocks));
pLDPC = false(CONST.payloadBitsPerFec, payloadLenInFecBlocks);
for i=1:1:payloadLenInFecBlocks
    pScrambled = payloadScrambler(CONST, scramblerInitialization, pBits(:,i));
    pLDPC(:,i) = LDPCEncoder(CONST, pScrambled, binl2dec(fecRate), binl2dec(blockSize), false);
end
pLDPC = pLDPC(:);
payloadOFDMSymbols = toneMapping(CONST, pLDPC, binl2dec(batId));

%% Transmiter
preambleTx = ofdmModulate(CONST, CONST.preambleOFDMSymbols, ...
    CONST.preambleBitsPerSubcarrier, CONST.preambleCyclicPrefixLen, ...
    CONST.preambleScramblerInit);

channelTx = ofdmModulate(CONST, CONST.channelOFDMSymbols, ...
    CONST.channelBitsPerSubcarrier, CONST.channelCyclicPrefixLen, ...
    CONST.channelScramblerInit);

headerTx = ofdmModulate(CONST, headerOFDMSymbols, ...
    CONST.headerBitsPerSubcarrier, CONST.headerCyclicPrefixLen, ...
    CONST.headerScramblerInit);

payloadTx = ofdmModulate(CONST, payloadOFDMSymbols, payloadBitsPerSubcarrier, ...
    payloadCyclicPrefixLen, CONST.payloadScramblerInit);

% Get parameters from parameters file
psduSizeLSB = flip(psduSize);
payloadBitsPerSubcarrierIn = payloadBitsPerSubcarrier;
payloadCyclicPrefixLenIn = payloadCyclicPrefixLen;

delayLen = 1000;

dataIn = [
    zeros(delayLen, 1); preambleTx; channelTx; headerTx; payloadTx; 
];

dataInR = real(dataIn);
dataInI = imag(dataIn);


% The peak is detected in the first sample of the channel estimation
peakIn = [
    false(delayLen, 1);
    false(CONST.preambleOFDMSamples, 1); true;
    false(length(channelTx)-1, 1);
    false(length(headerTx), 1);
    false(length(payloadTx), 1);
];

totalOFDMSymbols = payloadNumOFDMSymbols;

%% Expected Output
counterExpectedOut = 0;
expectedPayloadOut = cell(totalOFDMSymbols, 1);

headerRxLLR = ofdmDemodulate(CONST, headerTx, ...
    CONST.headerBitsPerSubcarrier, CONST.headerCyclicPrefixLen, ...
    CONST.headerScramblerInit, true);
expectedHeaderOut = headerRxLLR;

payloadRxLLR = ofdmDemodulate(CONST, payloadTx, ...
    payloadBitsPerSubcarrierIn, payloadCyclicPrefixLen, ...
    CONST.payloadScramblerInit, true);

for j=counterExpectedOut+1:1:counterExpectedOut + totalOFDMSymbols
    expectedPayloadOut{j} = payloadRxLLR(1+CONST.numDataCarriers*payloadBitsPerSubcarrier*(j-1-counterExpectedOut): ...
        CONST.numDataCarriers*payloadBitsPerSubcarrier*(j-counterExpectedOut));
end

counterExpectedOut = j;

%% Simulation Time
latency = 10000/CONST.fPHY;         % Algorithm latency. Delay between input and output
stopTime = (length(peakIn)-1)/CONST.fPHY + latency;

%% Run the simulation
model_name = "HDLOFDMSynched";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");

startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

startOut1 = get(simOut, "startOut1");
endOut1 = get(simOut, "endOut1");
validOut1 = get(simOut, "validOut1");

%% Test for reception of header
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(~isempty(startIdx), "No start signal");
assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");
assert(isequal(length(startIdx), 1), ...
    "Amount of headers should be equal at the amount of messages.")

out = dataOut(startIdx:endIdx, end-CONST.headerBitsPerSubcarrier+1:end);
out = out.';
headerOut = out(:);
assert(iskindaequal(expectedHeaderOut, headerOut, 0.5), "Header mismatch");
disp("Header was received correctly!");

%% Test for reception of payload
startIdx1 = find(startOut1 == true);
endIdx1 = find(endOut1 == true);

assert(isequal(length(startIdx1), length(endIdx1)), ...
    "Length of start and end should be the same.");
assert(~isempty(startIdx1), "No start signal");

for i=1:1:totalOFDMSymbols
    out = dataOut(startIdx1(i):endIdx1(i), end-payloadBitsPerSubcarrier+1:end);
    out = out.';
    out = out(:);
    assert(iskindaequal(expectedPayloadOut{i}, out, 0.5), "Payload mismatch");
end

%% Plotting
t = (0:1/CONST.fs:length(expectedHeaderOut)/CONST.fs-1/CONST.fs)';

figure();
subplot(2,1,1)
plot(t, headerOut, t, expectedHeaderOut);
legend("Out", "ExpectedOut");
xlabel("n [samples]");
xlim([t(1), t(end)]);
grid on;

subplot(2,1,2)
plot(t, abs(headerOut - expectedHeaderOut));
xlabel("n [samples]");
title("|out - expectedOut|");
xlim([t(1), t(end)]);
grid on;

figure();
subplot(2,1,1)
plot(t, out, t, expectedPayloadOut{i});
legend("Out", "ExpectedOut");
xlabel("n [samples]");
xlim([t(1), t(end)]);
grid on;

subplot(2,1,2)
plot(t, abs(out - expectedPayloadOut{i}));
xlabel("n [samples]");
title("|out - expectedOut|");
xlim([t(1), t(end)]);
grid on;


%% Create Vivado data file for VHDL testbench
if (createVivadoFile)
    % Generate input file
    fileName = "data_in_ofdm_synched_tb.mem";
    % input should be a fixdt(1, 16, 14)
    input = {dataInR*2^14; dataInI*2^14; peakIn};
    bitLen = [16, 16, 1];
    header = "dataInR,dataInI,peakIn";
    createVivadoDataFile(fileName, input, bitLen, header, ",");
end

disp("Test successfull!");




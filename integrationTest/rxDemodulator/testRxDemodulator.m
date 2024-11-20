%% Test Rx Modulator full implementation with:
% - Frequency Downshift
% - Decimator
% - OFDM demodulator
% - Constellation descrambler
% - QAM demodulation (with LLR)
% - Output datais formmated to have 4 bits, to be stored 

% TODO: check that this blocks has a significant error from the reference
% model, probably beacuse of the quantization of the ofdm demodulator
% block.
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
addpath("../../src/rx");
constants;

%% Inputs
parametersFile = "sampleParametersFile";
delayIn = 5000;
SNR = 60;

pBitsIn{1} = logical(randi([0,1], 5000, 1));
pBitsIn{2} = logical(randi([0,1], 80, 1));
pBitsIn{3} = logical(randi([0,1], 5000, 1));
%pBitsIn{4} = logical(randi([0,1], 80, 1));
%pBitsIn{5} = logical(randi([0,1], 80, 1));
%pBitsIn{6} = logical(randi([0,1], 5000, 1));
msgQtty = length(pBitsIn);

psduSizeLSB = zeros(24, 1, msgQtty+1);
payloadBitsPerSubcarrierIn = zeros(msgQtty, 1);
payloadCyclicPrefixLenIn = zeros(msgQtty, 1);
simPayloadNumOFDMSymbols = zeros(msgQtty, 1); % Used only for testing
dataIn = [];
OFDMRx = cell(msgQtty, 1);
for i=1:1:msgQtty
    pBits = pBitsIn{i};
    OFDMSignal = fullTx(CONST, parametersFile, pBits, 0, false);
    OFDMRx{i} = channelSimulation(OFDMSignal, delayIn, SNR);
    
    % Get parameters from header
    run(parametersFile);
    psduSizeLSB(:, 1, i) = flip(psduSize);
    payloadBitsPerSubcarrierIn(i, 1) = payloadBitsPerSubcarrier;
    payloadCyclicPrefixLenIn(i, 1) = payloadCyclicPrefixLen;
    simPayloadNumOFDMSymbols(i, 1) = payloadNumOFDMSymbols;

    dataIn = [dataIn; OFDMRx{i};];
end

% Used for simulation
totalOFDMSymbols = sum(simPayloadNumOFDMSymbols);

%% Expected Output
expectedHeaderOut = cell(msgQtty, 1);
counterExpectedOut = 0;
expectedPayloadOut = cell(totalOFDMSymbols, 1);
for i=1:1:msgQtty
    OFDMRx{i} = downshifter(CONST, OFDMRx{i});
    OFDMRx{i} = rxDecimator(CONST, OFDMRx{i});
    OFDMRx{i} = ofdmSymbolSync(CONST, OFDMRx{i});
    [OFDMRx{i}, channelEst] = ofdmChannelEstimation(CONST, OFDMRx{i});

    headerRx = OFDMRx{i}(1:CONST.headerOFDMSamples);
    headerRxLLR = ofdmDemodulate(CONST, headerRx, ...
        CONST.headerBitsPerSubcarrier, CONST.headerCyclicPrefixLen, ...
        CONST.headerScramblerInit, true, channelEst);
    expectedHeaderOut{i} = headerRxLLR;

    payloadRx = OFDMRx{i}(1+CONST.headerOFDMSamples:end);
    payloadRxLLR = ofdmDemodulate(CONST, payloadRx, ...
        payloadBitsPerSubcarrierIn(i), payloadCyclicPrefixLen, ...
        CONST.payloadScramblerInit, true, channelEst);

    for j=counterExpectedOut+1:1:counterExpectedOut + simPayloadNumOFDMSymbols(i, 1)
        expectedPayloadOut{j} = payloadRxLLR(1+CONST.numDataCarriers*payloadBitsPerSubcarrier*(j-1-counterExpectedOut): ...
            CONST.numDataCarriers*payloadBitsPerSubcarrier*(j-counterExpectedOut));
    end
    counterExpectedOut = j;
end

%% Simulation Time
latency = 500000/CONST.fs;         % Algorithm latency. Delay between input and output
stopTime = (length(dataIn)-1)/CONST.fs + latency;

%% Run the simulation
model_name = "HDLRxDemodulator";

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
assert(isequal(length(startIdx), msgQtty), ...
    "Amount of headers should be equal at the amount of messages.")

for i=1:1:msgQtty
    out = dataOut(startIdx(i):endIdx(i), end-CONST.headerBitsPerSubcarrier+1:end);
    out = out.';
    headerOut = out(:);
    assert(iskindaequal(expectedHeaderOut{i}, headerOut, 0.5), "Header mismatch");
end
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
t = (0:1/CONST.fs:length(expectedHeaderOut{1})/CONST.fs-1/CONST.fs)';

figure();
subplot(2,1,1)
plot(t, headerOut, t, expectedHeaderOut{msgQtty});
legend("Out", "ExpectedOut");
xlabel("n [samples]");
xlim([t(1), t(end)]);
grid on;

subplot(2,1,2)
plot(t, abs(headerOut - expectedHeaderOut{msgQtty}));
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

disp("Test successfull!");




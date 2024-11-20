%% Test OFDM Symbol Sync
clc; clear; close all;
addpath("../../src");
addpath("../../src/rx")
addpath("../../inc");
constants;

%% Inputs
delayIn = 100; % Number of samples that the preamble is delayed
SNR = 40;
frequencyOffsetIn = 5e3;

% Generate OFDM signal with time delay and frequency offset
preambleTx = ofdmModulate(CONST, CONST.preambleOFDMSymbols, ...
    CONST.preambleBitsPerSubcarrier, CONST.preambleCyclicPrefixLen, ...
    CONST.preambleScramblerInit);

channelTx = ofdmModulate(CONST, CONST.channelOFDMSymbols, ...
    CONST.channelBitsPerSubcarrier, CONST.channelCyclicPrefixLen, ...
    CONST.channelScramblerInit);

OFDMSignal = [preambleTx; channelTx];
OFDMSignal = txInterpolator(CONST, OFDMSignal);
OFDMSignal = upshifter(CONST, OFDMSignal);

% Important: i'm multipling by four so that the input goes from -1 to 1,
% forcing the maximum possible values here.
OFDMRx = 4*channelSimulation(OFDMSignal, delayIn, SNR);
OFDMRx = downshifter(CONST, OFDMRx, frequencyOffsetIn);
dataIn = rxDecimator(CONST, OFDMRx);

validIn = true(length(dataIn)-CONST.preambleFirstPartOFDMSamples, 1);

% Expected output
[expectedOFDMOut, expectedDelayOut, expectedMOut, expectedPeaksOut, ...
    expectedFrequencyOffset] = ofdmSymbolSync(CONST, dataIn);

%% Simulation Time
latency = (delayIn+10000)/CONST.fPHY;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/CONST.fPHY + latency;

%% Run the simulation
model_name = "HDLOFDMSS";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
mOut = get(simOut, "mOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");
peakOut = get(simOut, "peakOut");
indexOut = get(simOut, "indexOut");
frequencyOut = get(simOut, "frequencyOut");

%% Test M(d)
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");

for i=1:length(startIdx)
    mOutSim = mOut(startIdx(i):endIdx(i));
    assert(iskindaequal(expectedMOut, mOutSim, 10e-3));
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Test peaks
peaksSim = indexOut(peakOut ~= 0) - CONST.preambleOFDMSamples;
assert(isequal(peaksSim, expectedPeaksOut), "Peak position should be the same");

%% Test OFDM out
startChannel = find(peakOut == true, 1);
channelSim = dataOut(startChannel:startChannel-1+CONST.channelOFDMSamples);
assert(iskindaequal(channelSim, expectedOFDMOut, 1e-3), "The output sample should be the first sample of the channel estimation");

%% Test frequency offset
frequencySim = frequencyOut(startChannel);
assert(iskindaequal(frequencySim, expectedFrequencyOffset, 10), "Frequency Offset generated and calculated should be the same");

%% Plotting
figure();
n = 0:1:length(mOutSim)-1;

subplot(2,1,1);
plot(n, real(mOutSim), n, real(expectedMOut));
legend("Out", "ExpectedOut");
xlabel("n [samples]");
ylabel("M(d)");
title("M(d) = |P|^2/Rf^2");
xlim([min(n), max(n)]);
grid on;

subplot(2,1,2);
plot(n, abs(mOutSim-expectedMOut));
xlabel("n [samples]");
ylabel("Error");
title("|out - expectedOut|");
xlim([min(n), max(n)]);
grid on;

disp("Test successfull!");

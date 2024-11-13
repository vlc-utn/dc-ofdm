%% Test Modulator full implementation with:
% - Input data simulating a RAM with a full frame, formatted with 12 bits 
% per symbol (no matter the actual QAM modulation order).
% - Tone mapping.
% - QAM modulation.
% - Constellation scrambler.
% - OFDM modulator.
% - Frequency up-shift.
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;
parameters;

%% Transmitter pre-processing
h = headerGenerate(CONST, psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
h = headerScrambler(CONST, h);
h = LDPCEncoder(CONST, h, 0, 0, true);
headerOFDMSymbols = headerRepetitionEncoder(CONST, h);

dataBitsLsb = logical(randi([0 1], CONST.payloadBitsPerBlock0, payloadLenInFecBlocks));
for i=1:1:payloadLenInFecBlocks
    p = payloadScrambler(CONST, scramblerInitialization, dataBitsLsb(:,1));
    p = LDPCEncoder(CONST, p, binl2dec(fecRate), binl2dec(blockSize), false);
    payloadTotal(:, i) = p;
end
payloadOFDMSymbols = toneMapping(CONST, payloadTotal(:), binl2dec(batId));


%% Expected Output
preambleTx = ofdmModulate(CONST, CONST.preambleOFDMSymbols, ...
    CONST.preambleBitsPerSubcarrier, CONST.preambleCyclicPrefixLen, ...
    CONST.preambleScramblerInit);
channelTx = ofdmModulate(CONST, CONST.channelOFDMSymbols, ...
    CONST.channelBitsPerSubcarrier, CONST.channelCyclicPrefixLen, ...
    CONST.channelScramblerInit);
headerTx = ofdmModulate(CONST, headerOFDMSymbols, ...
    CONST.headerBitsPerSubcarrier, CONST.headerCyclicPrefixLen, ...
    CONST.headerScramblerInit);
payloadTx = ofdmModulate(CONST, payloadOFDMSymbols, ...
    payloadBitsPerSubcarrier, payloadCyclicPrefixLen, ...
    CONST.payloadScramblerInit);

OFDMSignal = [preambleTx; channelTx; headerTx; payloadTx;];
OFDMSignal = txInterpolator(CONST, OFDMSignal);
expectedOut = upshifter(CONST, OFDMSignal);

%% Inputs
% The same symbol will be sent "numberOfRepetitions" times.
numberOfRepetitions = 2; % Don't modify

% Raw bits to words for the header
hx = headerOFDMSymbols(:);
h = zeros(length(hx)/CONST.headerBitsPerSubcarrier, 1);
for i=1:CONST.headerBitsPerSubcarrier:length(hx)-1
    h(floor(double(i)/double(CONST.headerBitsPerSubcarrier))+1) = binl2dec(hx(i:i+CONST.headerBitsPerSubcarrier-1));
end

% Raw bits to words for the payload
px = payloadOFDMSymbols(:);
p = zeros(length(px)/payloadBitsPerSubcarrier, 1);
for i=1:payloadBitsPerSubcarrier:length(px)-1
    p(floor(double(i)/double(payloadBitsPerSubcarrier))+1) = binl2dec(px(i:i+payloadBitsPerSubcarrier-1));
end

dataSymbols = [
    CONST.preambleOFDMSymbols(:);
    CONST.channelOFDMSymbols(:);
    h(:);
    p(:);
];

bitsPerSubcarrier = [
    repmat(CONST.preambleBitsPerSubcarrier, length(CONST.preambleOFDMSymbols(:)), 1);
    repmat(CONST.channelBitsPerSubcarrier, length(CONST.channelOFDMSymbols(:)), 1);
    repmat(CONST.headerBitsPerSubcarrier, length(headerOFDMSymbols(:))/CONST.headerBitsPerSubcarrier, 1);
    repmat(payloadBitsPerSubcarrier, length(payloadOFDMSymbols(:))/payloadBitsPerSubcarrier, 1);
];

init = [
    repmat(CONST.preambleScramblerInit, length(CONST.preambleOFDMSymbols(:)), 1);
    repmat(CONST.channelScramblerInit, length(CONST.channelOFDMSymbols(:)), 1);
    repmat(CONST.headerScramblerInit, length(headerOFDMSymbols(:))/CONST.headerBitsPerSubcarrier, 1);
    repmat(CONST.payloadScramblerInit, length(payloadOFDMSymbols(:))/payloadBitsPerSubcarrier, 1);
];

cpLen = [
    repmat(CONST.preambleCyclicPrefixLen, length(CONST.preambleOFDMSymbols(:)), 1);
    repmat(CONST.channelCyclicPrefixLen, length(CONST.channelOFDMSymbols(:)), 1);
    repmat(CONST.headerCyclicPrefixLen, length(headerOFDMSymbols(:))/CONST.headerBitsPerSubcarrier, 1);
    repmat(payloadCyclicPrefixLen, length(payloadOFDMSymbols(:))/payloadBitsPerSubcarrier, 1);
];

validIn = [
    true(length(dataSymbols), 1);
];

newPsdu = true;

%% Simulation Time
latency = 1000000/CONST.fs;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/CONST.fs + latency;

%% Run the simulation
model_name = "HDLModulatorFull";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

%% Compare with MATLAB reference algorithm

startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");
assert(~isempty(startIdx), "No start signal");

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    assert(iskindaequal(expectedOut, out, 50e-3), "Output mismatch");
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Plotting
if (all([simNormal == true, simLarge == false]))
    t = (0:1/CONST.fDAC:length(expectedOut)/CONST.fDAC-1/CONST.fDAC)';

    figure();
    subplot(2,1,1)
    plot(t*1e6, out, t*1e6, expectedOut);
    legend("Out", "ExpectedOut");
    xlabel("Time [useg]");
    xlim([min(t), max(t)]*1e6);
    grid on;

    subplot(2,1,2)
    plot(t*1e6, abs(out - expectedOut));
    xlabel("Time [useg]");
    title("|out - expectedOut|");
    xlim([min(t), max(t)]*1e6);
    grid on;

    figure();
    resampledOut = resample(out, CONST.txM, 1);
    [psd, fVector] = pwelch(resampledOut, rectwin(length(resampledOut)), [], 2^16, 2*CONST.fDAC, "centered");
    plot(fVector/1e6, 10*log10(psd));
    title("PSD of the transmitted signal")
    xlabel("Freq. [MHz]");
    ylabel("PSD [dB/Hz]");
    grid on;
end

disp("Test successfull!");

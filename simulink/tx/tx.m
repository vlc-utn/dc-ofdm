%% Transmitter
% This file contains a fully functional transmitter.
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Input
createVivadoFile = true;
paramFile = "sampleParametersFile";
msgIn{1} = ['This is an example message used to test the transmitter. ' ...
   'It is made large on purpose to test for a large message being ' ...
   'transmitted'];
msgIn{2} = 'This is a second message';
msgIn{3} = 'This is a third message';
% msgIn{1} = randomStr(4096);

if (createVivadoFile)
    % Only one message
    a = msgIn{1}; msgIn = cell(1,1); msgIn{1} = a;
end

pWords = [];
validIn = [];
lastIn = [];
for i=1:1:length(msgIn)
    pBitsRaw{i} = str2binl(msgIn{i});
    pBits{i} = getPayloadParamsFromBits(CONST, pBitsRaw{i});
    pWords = [pWords binl2str(pBits{i})];
    len = length(binl2str(pBits{i}));
    validIn = [validIn; true(len, 1);];
end

newFrame = true;

%% Expected Output
expectedOut = cell(length(msgIn), 1);
payloadOFDMSymbols = cell(length(msgIn), 1);
reg0 = zeros(length(msgIn), 1);
reg1 = zeros(length(msgIn), 1);
reg2 = zeros(length(msgIn), 1);
reg3 = zeros(length(msgIn), 1);

for i=1:1:length(msgIn)
    [reg0(i,1), reg1(i,1), reg2(i,1), reg3(i,1)] = param2regs(CONST, paramFile, pBitsRaw{i});
    [expectedOut{i}, ~, payloadOFDMSymbols{i}] = fullTx(CONST, paramFile, binl2tx(pBitsRaw{i}), 0, false);
    payloadOFDMSymbols{i} = payloadOFDMSymbols{i}(:);
end

%% Simulation Time
latency = 1000000/CONST.fDAC;             % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/CONST.fDAC + latency;

%% Run the simulation
model_name = "HDLTx";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

dataOut1 = get(simOut, "dataOut1");
startOut1 = get(simOut, "startOut1");
endOut1 = get(simOut, "endOut1");
validOut1 = get(simOut, "validOut1");

%% Payload is well formed
startIdx1 = find(startOut1 == true);
endIdx1 = find(endOut1 == true);

assert(~isempty(startIdx1), ...
    "StartIdx shouldn't be empty");
assert(isequal(length(startIdx1), length(endIdx1)), ...
    "Start and end should be of the same size");
assert(isequal(length(startIdx1), length(msgIn)), ...
    "Messages and start indexes should be the same number");

for i=1:1:length(msgIn)
    out = dataOut1(startIdx1(i):endIdx1(i));
    valid = validOut1(startIdx1(i):endIdx1(i));
    out = out(valid == true);
    assert(isequal(payloadOFDMSymbols{i}, out));
end

%% Compare with MATLAB reference algorithm
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(~isempty(startIdx), ...
    "StartIdx shouldn't be empty");
assert(isequal(length(startIdx), length(endIdx)), ...
    "Start and end should be of the same size");
assert(isequal(length(startIdx), length(msgIn)), ...
    "Messages and start indexes should be the same number");

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    expectedOut{i} = expectedOut{i}*2; % Add DAC correction factor
    assert(iskindaequal(expectedOut{i}, out, 1e-3), "Outputs don't match");
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Plotting
t = (0:1/CONST.fDAC:length(expectedOut{i})/CONST.fDAC - 1/CONST.fDAC)';

figure();
subplot(2,1,1)
plot(t*1e6, out, t*1e6, expectedOut{i});
legend("Out", "ExpectedOut");
xlabel("t [useg]");
xlim([min(t), max(t)]*1e6);
grid on;

subplot(2,1,2)
plot(t*1e6, abs(out - expectedOut{i}));
xlabel("t [useg]");
title("|out - expectedOut|");
xlim([min(t), max(t)]*1e6);
grid on;

figure();
resampledOut = resample(out, CONST.txL, 1);
[psd, fVector] = pwelch(resampledOut, rectwin(length(resampledOut)), [], 2^16, 2*CONST.fDAC, "centered");
plot(fVector/1e6, 10*log10(psd));
title("PSD of the transmitted signal")
xlabel("Freq. [MHz]");
ylabel("PSD [dB/Hz]");
grid on;

%% Create Vivado data file for VHDL testbench
if (createVivadoFile)
    % Generate input file
    fileName = "data_in.mem";
    input = {uint8(pWords');};
    bitLen = 8;
    header = "dataIn";
    createVivadoDataFile(fileName, input, bitLen, header, ",");
    
    % Generate output file
    fileName = "data_out.mem";
    fileOut = out*2^15;
    input = {fileOut;};
    bitLen = 16;
    header = "dataOut";
    createVivadoDataFile(fileName, input, bitLen, header, ",");
    disp("Vivado memory files generated!");
end

disp("Test successfull!");

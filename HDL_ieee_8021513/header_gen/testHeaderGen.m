%% Test Header Generatation
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Input
paramFile = "param.m";
run(paramFile);

[reg0, reg1, reg2, reg3] = param2regs(CONST, paramFile, false);

newFrame = logical([ ...
    1; ...
    false(500, 1)]);

%% Simulation Time
latency = 300/CONST.fs;         % Algorithm latency. Delay between input and output
stopTime = (length(newFrame)-1)/CONST.fs + latency;

%% Run the simulation
model_name = "HDLHeaderGen";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

%% Compare with MATLAB reference algorithm

expectedOut = headerGenerate(CONST, psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
expectedOut = expectedOut(1:end-16); % Remove CRC

startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(~isempty(startIdx), "startIdx shouldn't be empty")
assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    assert(isequal(expectedOut, out));
end

disp("Test successfull!");


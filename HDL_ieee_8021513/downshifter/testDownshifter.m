%% Test Downshifter
clc; clear; close all;
addpath("../../src");
addpath("../../src/rx")
addpath("../../inc");
constants;

%% Inputs
nSym = 10;
input{1} = rand(nSym*CONST.N*CONST.oversamplingFactor, 1);
%input{2} = rand(nSym*CONST.N*CONST.oversamplingFactor, 1);
%input{3} = rand(nSym*CONST.N*CONST.oversamplingFactor, 1);
%input{4} = rand(nSym*CONST.N*CONST.oversamplingFactor*100, 1);

frequencyOffsetIn{1} = 5;
%frequencyOffsetIn{2} = -5;
%frequencyOffsetIn{3} = -14444;
%frequencyOffsetIn{4} = +15133;

dataIn = [
    input{1};
    zeros(100, 1);
];

validIn = [
    true(size(input{1}));
    false(100, 1);
];

frequencyOffset = [
    frequencyOffsetIn{1}*ones(size(input{1}));
    zeros(100, 1);
];

%% Simulation Time
latency = 200/CONST.fADC;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/CONST.fADC + latency;

%% Run the simulation
model_name = "HDLDownshifter";

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

for i=1:length(startIdx)
    n = (0:1:length(input{i})-1)';
    out = dataOut(startIdx(i):endIdx(i));
    expectedOut = downshifter(CONST, input{i}, frequencyOffsetIn{i});
    assert(iskindaequal(expectedOut, out, 0.2), "Downshifter output is not the same");
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Plotting
figure();
subplot(2,1,1);
plot(n, real(out), n, real(expectedOut));
legend("Out", "ExpectedOut");
xlabel("n [samples]");
ylabel("Signals");
title("Downshifter output");
xlim([min(n), max(n)]);
grid on;

subplot(2,1,2);
plot(n, abs(out-expectedOut));
xlabel("n [samples]");
ylabel("Error");
title("|out - expectedOut|");
xlim([min(n), max(n)]);
grid on;

disp("Test successfull!");

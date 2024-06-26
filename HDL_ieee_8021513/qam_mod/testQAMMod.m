clc; clear; close all;

%% Test Header FEC
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Inputs
delay = zeros(100,1);

M = [1 2 4 6];

bitsPerSubcarrier = [
    ones(200, 1)*M(1);
    delay;
    ones(200,1)*M(2);
    delay;
    ones(200,1)*M(3);
    delay;
    ones(200,1)*M(4);];

dataSymbols = randi([0 255], length(bitsPerSubcarrier), 1);

validIn = logical(bitsPerSubcarrier);

%% Simulation Time
fs = 1;                 % Output sample frequency
latency = 300;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fs + latency;

%% Run the simulation
model_name = "HDLQAMMod";

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
    out = dataOut(startIdx(i):endIdx(i));
    data = dataSymbols(1+(i-1)*200:i*200);
    data = bitand(data, 2^M(i)-1);
    expectedOut = qammod(data, 2^M(i), UnitAveragePower=true, PlotConstellation=false, InputType='integer');
    assert(iskindaequal(expectedOut, out, 1e-3));
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Plotting
n = 1:1:length(out);

figure();
subplot(2,1,1)
plot(n, abs(out), n, abs(expectedOut));
legend("Out", "ExpectedOut");
xlabel("n [samples]");
xlim([n(1), n(end)]);
grid on;

subplot(2,1,2)
plot(n, abs(out - expectedOut));
xlabel("n [samples]");
title("|out - expectedOut|");
xlim([n(1), n(end)]);
grid on;

disp("Test successfull!");

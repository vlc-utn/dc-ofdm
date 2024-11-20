%% Test Decimator
clc; clear; close all;
addpath("../../src");
addpath("../../src/rx")
addpath("../../inc");
constants;

%% Inputs
fIn = CONST.fADC;
fOut = fIn/CONST.rxM;
t = (0:1/fIn:(CONST.N+CONST.headerCyclicPrefixLen)/fOut-1/fIn)';            % Time vector is equal to "N" ofdm samples
t_down = (0:1/fOut:(CONST.N+CONST.headerCyclicPrefixLen)/fOut-1/fOut)';     % Time vector for downsampled signal

% OFDM output is a senoidal function
fc = 25e6;                           % Carrier frequency for sinusoidal function
input = cos(2*pi*fc*t);
dataIn = [
    input;
    zeros(500, 1);
    %input;
];
validIn = [
    true(length(t), 1);
    false(500, 1);
    %true(length(t), 1);
];

expectedOut = rxDecimator(CONST, input);

%% Simulation Time
latency = 1000/fIn;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fIn + latency;

%% Run the simulation
model_name = "HDLDecimator";

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
    assert(iskindaequal(expectedOut, out, 10e-3));
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Plotting
resampledOut = resample(input, 1, CONST.rxM);

figure();
subplot(4,1,1)
plot(t*1e6, abs(input), t_down*1e6, abs(expectedOut), t_down*1e6, abs(resampledOut));
xlabel("Time [useg]");
legend("Input", "Interpolated", "Resampled");
xlim([min(t), max(t)]*1e6);

subplot(4,1,2);
plot(t_down*1e6, abs(expectedOut-resampledOut));
xlabel("Time [useg]");
title("Error between interpolation FIR filter and resample FIR filter")
xlim([min(t_down), max(t_down)]*1e6);

subplot(4,1,3)
plot(t_down*1e6, abs(out - expectedOut));
xlabel("Time [useg]");
title("|out - expectedOut|");
xlim([min(t_down), max(t_down)]*1e6);
grid on;

subplot(4,1,4)
plot(t_down*1e6, abs(out), t_down*1e6, abs(expectedOut));
xlabel("Time [useg]");
title("Output");
legend("Simulink Out", "Expected Out");
xlim([min(t_down), max(t_down)]*1e6);
grid on;

assert(iskindaequal(expectedOut, resampledOut, 0.4), "resample function and interpolation should be similar");

disp("Test successfull!");

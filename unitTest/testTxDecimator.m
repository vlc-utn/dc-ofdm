%% Test Tx Decimator
clc; clear; close all;
addpath("../src");
addpath("../src/rx");
addpath("../inc");
constants;

%% Test cases
% Size of the header after FEC encoding
fIn = CONST.fPHY*CONST.txL;
fc = 5e6;
symbolNumber = 10;

t = (0:1/fIn:symbolNumber/fc-1/fIn)';
input = sin(2*pi*fc*t);

out = txDecimator(CONST, input);
resample_out = resample(input, 1, CONST.txM);

n = 1:1:length(input);
n_down = 1:CONST.txM:CONST.txM*length(resample_out);
n_dec = (1:CONST.txM:CONST.txM*length(out))';

%% Plot
figure();
subplot(3,1,1);
plot(n, input, n_down, resample_out, n_dec, out);
title("Signals")
legend("Input", "Resampled", "Decimated");
grid on;

subplot(3,1,2);
plot(n_down, abs(resample_out - out));
title("Error between resample and decimation");
grid on;

subplot(3,1,3);
plot(n_down, abs(input(1:CONST.txM:end) - out));
title("Error between input and decimated");
grid on;

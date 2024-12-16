%% Create waveforms to be used for periodic TX in the Red Pitaya

clc; clear; close all;
addpath("../src");
addpath("../inc")
%constants;

%% Parameters
fs = 125e6;             % [Hz] Sampling frequency
fcString = {'1'; '5'; '10'; '15'; '20'; '25'; '30'; '35'; '40'; '45'; ...
    '50'; '55'; '60'};  % [MHz] Carrier frequency

%% Internal processing
fc = zeros(size(fcString));
t = cell(size(fcString));
signal = cell(size(fcString));

for i=1:1:length(fcString)
    fc(i) = str2double(fcString{i})*1e6;

    % For the signal to be reapeated, we need to find the mcm between
    % fc and fs, and "mcm" will be one repetition
    samples = lcm(fc(i), fs) / 1e6;
    t{i} = (0 : 1/fs : samples/fs - 1/fs);
    
    % Assume fixdt(1, 14, 13)
    signal{i} = round(0.2*sin(2*pi*fc(i)*t{i}) * 2^13);
end

for i=1:1:length(signal)
    fileName = sprintf("waveform_sin_%smhz_02.mem", fcString{i});
    input = signal(i);
    bitLen = 16;
    createVivadoDataFile(fileName, input, bitLen);
end

    

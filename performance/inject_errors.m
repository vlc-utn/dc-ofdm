%% Inject errros
% Tries injecting errores before the LDPC decoder to see how much it can
% handle
clc; clear; close all;
addpath("../src");
addpath("../inc");
addpath("../src/rx");
constants;

%% Parameters
parametersFile = "sampleParametersFile.m";
delayIn = 200;
SNR = 120;
msg = randomStr(4000);
errorQtty = 50;

%% Message transmission
pBits = str2binl(msg);
OFDMSignal = fullTx(CONST, parametersFile, pBits);

OFDMRx = channelSimulation(OFDMSignal, delayIn, SNR);

[pBitsRx, err, delayOut, frequencyOffsetOut] = fullRx(CONST, OFDMRx, 0, errorQtty);

%% Tests
msgRx = binl2str(pBitsRx);
assert(err==0, "The header should have been received without errors");
assert(isequal(msg, msgRx), "Message should be equal");

disp("Test Successfull!");

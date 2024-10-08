%% Test transmission and reception of an image
% The image is transmitted in raw RGB bits.
% Warning: test can take several minutes to run!
% TODO, failing test after adding interpolator and decimator for 125MHz
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
addpath("../../src/rx");
constants;

parametersFile = "sampleParametersFile.m";
imageFile = "test_image.png";

msg = imread(imageFile);
[pBits, imageH, imageW, imageC] = img2binl(imageFile);

OFDMSignal = fullTx(CONST, parametersFile, pBits);
pBitsRx = fullRx(CONST, OFDMSignal);

msgRx = binl2img(pBitsRx, imageH, imageW, imageC);
assert(isequal(msg, msgRx));

disp("Test Successfull!");

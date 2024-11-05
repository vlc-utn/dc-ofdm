%% Test transmission and reception of text
clc; clear; close all;
addpath("../src");
addpath("../inc");
addpath("../src/rx");
addpath("../../digital_signals");
constants;

%% Parameters
parametersFile = "sampleParametersFile.m";
delayIn = 200;
%msg = 'From the VLC UTN project we wish you, the reader, a good day.';
msg = randomStr(1024);
frequencyOffsetIn = 0;


EbNo = 0:2:40;
ser = zeros(length(EbNo), 1);

%% Message transmission
pBits = str2binl(msg);
OFDMSignal = fullTx(CONST, parametersFile, pBits);

for i=1:1:length(EbNo)
    OFDMRx = [zeros(delayIn, 1); OFDMSignal];
    OFDMRx = Channel.add_awgn_noise(OFDMRx, EbNo(i));
    [pBitsRx, err, delayOut, frequencyOffsetOut] = fullRx(CONST, OFDMRx, frequencyOffsetIn);

    ser(i) = sum(pBits~=pBitsRx)/length(pBits);


end

%% Plotting

ser_theory = Theory.ser_AWGN("QAM", 4, EbNo);

semilogy(EbNo, ser, LineStyle="-"); hold on;
semilogy(EbNo, ser_theory, LineStyle="--"); hold on;

legendString{1} = strcat(num2str(4), "-", "QAM", " Simulated");
legendString{2}   = strcat(num2str(4), "-", "QAM", " Theoretical");

grid on;
legend(legendString);
xlabel("Es/N0 [dB]");
ylabel("SER");
title("Symbol Error Rate");
ylim([1e-6, 1]);


%% Tests



% assert(err==0, "The header should have been received without errors");
% assert(isequal(msg, msgRx), "Message should be equal");
% assert(iskindaequal(delayOut, delayIn/CONST.rxM, 1), "Delays should match");
% assert(iskindaequal(frequencyOffsetIn, -frequencyOffsetOut, 50), ...
%     "Frequency offset should be less than 50Hz");

disp("Test Successfull!");

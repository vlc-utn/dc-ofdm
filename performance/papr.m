%% This scripts tests the PAPR.
% PAPR (Peak to Average Power Ratio) is best defined as a probability of an
% OFDM symbols reaching "X" power.

clc; clear; close all;
addpath("../inc");
addpath("../src");
constants;

%% TEST
M = 16;
N = 256;
printPDF = true;

%dataIn = matlab_ipsum('Paragraphs', 1000);
dataIn = randomStr(1000000, true, 90, true);
dataIn = str2binl(dataIn);
dataIn = dataIn(1:1:end - mod(length(dataIn), N*log2(M)));

outScrambled = payloadScrambler(CONST, [1 1 1 1], dataIn);

qamSignal = qammod(uint8(outScrambled), M, UnitAveragePower=true, PlotConstellation=false, InputType="bit");
qamSignal = reshape(qamSignal, N, []);
scrambled = ofdmmod(qamSignal, N, 0);
scrambled = reshape(scrambled, N, []);

qamSignal = qammod(uint8(dataIn), M, UnitAveragePower=true, PlotConstellation=true, InputType="bit");
qamSignal = reshape(qamSignal, N, []);
notScrambled = ofdmmod(qamSignal, N, 0);
notScrambled = reshape(notScrambled, N, []);


%% Peak power
scrambled = awgn(scrambled, 10, "measured");
notScrambled = awgn(notScrambled, 10, "measured");

scrambledPower = rms(scrambled, 1).^2*N;
notScrambledPower = rms(notScrambled, 1).^2*N;

% Average power is 1W
PAPRScrambled = 10*log(scrambledPower/mean(scrambledPower));
PAPRNotScrambled = 10*log(notScrambledPower/mean(notScrambledPower));

figure();
plot(PAPRScrambled); hold on;
plot(PAPRNotScrambled); hold on;
legend("Scrambled", "Not scrambled")


db_points = 0:0.2:10;
CCDF_scrambled = zeros(length(db_points), 1);
CCDF_notScrambled = zeros(length(db_points), 1);
for i=1:1:length(db_points)
    CCDF_scrambled(i) = sum(PAPRScrambled > db_points(i))/length(PAPRScrambled);
    CCDF_notScrambled(i) = sum(PAPRNotScrambled > db_points(i))/length(PAPRNotScrambled);
end
fsize = 32;
fig = figure(WindowState="maximized");
semilogy(db_points, CCDF_scrambled, LineWidth=2, Marker="square", MarkerSize=12); hold on;
semilogy(db_points, CCDF_notScrambled, LineWidth=2, Marker="o", MarkerSize=12);
legend("Scrambled", "Not scrambled", Interpreter="latex")
ylabel("Probability$\{PAPR > PAPR_0 \}$", FontSize=fsize, Interpreter="latex")
xlabel("PAPR [dB]", FontSize=fsize, Interpreter="latex")
grid on;
fontsize(gca, fsize, "points");
set(gca,'TickLabelInterpreter','latex');

if (printPDF)
    pause(1);
    exportgraphics(fig, 'graphs/papr.pdf', ContentType='vector')
end



%% OFDM Subcarriers
% Plot the individual OFDM subcarriers in frequency.
clc; clear; close all;

%% Parameters
exportPDF = true;                     
fsc = 10;                         % Subcarrier frequency
N = 8;                              % Number of subcarriers

%% Internal configuration
% Make the figure full screen for exporting to PDF
if (exportPDF)
    window = "maximized";       
else
    window = "normal";
end

fs = fsc*N*1.5;                     % Edge frequency of the graph  
fsize = 32;
f = linspace(-fs/2, fs/2, 10000);   % Frequency vector
xLabels = {"$-6 f_{sc}$", "$-5 f_{sc}$", "$-4 f_{sc}$", "$-3 f_{sc}$", "$-2 f_{sc}$", ...
    "$-1 f_{sc}$", "0", "$1 f_{sc}$", "$2 f_{sc}$", ...
    "$3 f_{sc}$", "$4 f_{sc}$", "$5 f_{sc}$", "$6 f_{sc}$"};

%% Plot all subcarriers separated
figure(WindowState=window);
% Signal to plot is the sum of sinc pulses, as:
% sum_{k=0}^{N-1} | sin(pi * (f- fk)/fsc) / (pi * (f-fk) /fsc)  |
ofdm = 0;
legendString = cell(N, 1);
for i=-N/2:1:N/2-1
    signal = abs(sinc((f-i*fsc)/fsc)).^2;
    plot(f, signal, LineWidth=2);
    hold on;
    ofdm = ofdm + signal;
    legendString{i+N/2+1} = sprintf("k=%d,f_k = %d", i, i*fsc);
end

xlabel('Frequency [Hz]', FontSize=fsize ,Interpreter="latex");
ylabel('PSD $[\frac{1}{Hz}]$', FontSize=fsize, Interpreter="latex");
%title("Se\~{n}al OFDM, con coeficientes -N/2", Interpreter="latex");
grid on;
ax = gca;
ax.YGrid = 'off';
ax.GridLineWidth = 1.5;
ax.GridAlpha = 0.5;
ax.GridLineStyle = "--";

fontsize(gca, fsize, "points");
set(gca,'TickLabelInterpreter','latex');

xlim([min(f), max(f)]);
xticks(min(f):fsc:max(f));

%yticks(NaN);
xticklabels(xLabels);
%legend(legendString);

if (exportPDF)
    pause(1)
    exportgraphics(gcf, 'ofdm/ofdm_subcarriers.pdf', ContentType='vector')
end

%% Plotear señal OFDM en comparación con señal QAM
% Se quiere ver el rolloff de "fsc" de la SINC

fs = fsc*N*4;
f = linspace(-fs/2, fs/2, 10000);   % Frequency vector
figure(WindowState=window);

ofdm = 0;
for i=-N/2:1:N/2-1
    signal = (sinc((f-i*fsc)/fsc)).^2;
    ofdm = ofdm + signal;
end

plot(f, 10*log((sinc(f/(fsc*N))).^2), LineWidth=2);
hold on;
plot(f, 10*log(ofdm), LineWidth=2);

xlabel('Frequency [Hz]', FontSize=fsize ,Interpreter="latex");
ylabel('PSD $[\frac{dB}{Hz}]$', FontSize=fsize, Interpreter="latex");
xlim([min(f), max(f)]);
grid on;
ylim([-60, 0]);
legend("QAM", "OFDM", Interpreter="latex")

fontsize(gca, fsize, "points");
set(gca,'TickLabelInterpreter','latex');

xticks([-2*N*fsc, -N*fsc, -5*fsc, -fsc*4, -fsc*3, -fsc*2, -fsc, 0, ...
    fsc, 2*fsc, 3*fsc, 4*fsc, N*fsc, 2*N*fsc])

xticklabels({"$-2 f_{PHY}$", "", "$-\frac{N/2+1}{N} f_{PHY}$", ...
    "", "", "", "", "0", "", "", "", ...
    "$\frac{1}{2} f_{PHY}$", "$f_{PHY}$", "$2 f_{PHY}$"})
xtickangle(0)

ax = gca;
ax.GridLineWidth = 1;
%ax.GridAlpha = 0.5;

if (exportPDF)
    exportgraphics(gcf, 'ofdm/ofdm_slope.pdf', ContentType='vector')
end

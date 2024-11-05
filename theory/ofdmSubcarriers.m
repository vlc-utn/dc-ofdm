%% OFDM Subcarriers
% Plot the individual OFDM subcarriers in frequency.
clc; clear; close all;

%% Parameters
exportPDF = false;                     
fsc = 15e6;                         % Subcarrier frequency
N = 8;                              % Number of subcarriers

%% Internal configuration
% Make the figure full screen for exporting to PDF
if (exportPDF)
    window = "maximized";       
else
    window = "normal";
end

fs = fsc*N*1.5;                     % Edge frequency of the graph  
fsize = 20;
f = linspace(-fs/2, fs/2, 10000);   % Frequency vector
xLabels = {"$-6 f_{sc}$", "$-5 f_{sc}$", "$-4 f_{sc}$", "$-3 f_{sc}$", "$-2 f_{sc}$", ...
    "$-1 f_{sc}$", "0", "$1 f_{sc}$", "$-2 f_{sc}$", ...
    "$3 f_{sc}$", "$4 f_{sc}$", "$5 f_{sc}$", "$6 f_{sc}$"};

%% Plot all subcarriers separated
figure(WindowState=window);
% Signal to plot is the sum of sinc pulses, as:
% sum_{k=0}^{N-1} | sin(pi * (f- fk)/fsc) / (pi * (f-fk) /fsc)  |
ofdm = 0;
legendString = cell(N, 1);
for i=-N/2:1:N/2-1
    signal = abs(sinc((f-i*fsc)/fsc));
    plot(f/1e6, signal, LineWidth=2);
    hold on;
    ofdm = ofdm + signal;
    legendString{i+N/2+1} = sprintf("k=%d,f_k = %d", i, i*fsc);
end

xlabel('Frecuencia', FontSize=fsize ,Interpreter="latex");
ylabel('Subportadoras', FontSize=fsize, Interpreter="latex");
%title("Se\~{n}al OFDM, con coeficientes -N/2", Interpreter="latex");
grid on;
ax = gca;
ax.YGrid = 'off';
ax.GridLineWidth = 1.5;
ax.GridAlpha = 0.5;
ax.GridLineStyle = "--";

fontsize(gca, fsize, "points");
set(gca,'TickLabelInterpreter','latex');

xlim([min(f)/1e6, max(f)/1e6]);
xticks(min(f)/1e6:fsc/1e6:max(f)/1e6);

%yticks(NaN);
xticklabels(xLabels);
%legend(legendString);

if (exportPDF)
    exportgraphics(gcf, 'ofdm/ofdm_subcarriers.pdf', ContentType='vector')
end

%% Plotear señal OFDM en comparación con señal QAM
% Se quiere ver el rolloff de "fsc" de la SINC

fs = 1000e6;
fsc = 25e6;
f = -fs/2:10000:fs/2-1;
figure(WindowState=window);

ofdm = 0;
for i=-N/2:1:N/2-1
    signal = (sinc((f-i*fsc)/fsc)).^2;
    ofdm = ofdm + signal;
end

ofdm = abs(ofdm);

plot(f/1e6, (sinc(f/200e6)).^2);
hold on;
plot(f/1e6, ofdm)

xlabel('Frecuencia $[MHz]$', FontSize=18 ,Interpreter="latex");
ylabel('PSD', FontSize=18, Interpreter="latex");
xlim([min(f)/1e6, max(f)/1e6]);
grid on;

if (exportPDF)
    exportgraphics(gcf, 'ofdm/ofdm_slope.pdf', ContentType='vector')
end

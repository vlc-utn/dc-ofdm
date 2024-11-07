%% Cyclic Prefix
% Create a figure with a cyclic prefix
clc; clear; close all;

%% Parameters
printPDF = false;
fs = 100;           % Frecuencia de muestreo
fc1 = 1;            % Frecuencia de la primera subportadora
fc2 = 2;            % Frecuencia de la segunda subportadora
tOFDM = 3;          % OFDM symbol time
td = 0.5;           % Delay for one of the OFDM symbols
nPoints = 2000;     % Number of points to plot

%% Intermediate definitions
t = linspace(0, tOFDM*2 + td, nPoints);         % Time vector

tFirstSymbol = t(t <= tOFDM & t > 0);          % Lower half of time vector
tSecondSymbol = t(t > tOFDM & t < 2*tOFDM);     % Upper half of time vector 
tDelayFinal = t(t >= 2*tOFDM);

tDelayInitial = t(t < td);
tFirstSymbolDelayed = t(t <= tOFDM + td & t > td);
tSecondSymbolDelayed = t(t >= tOFDM + td);

%% Plotting parameters
if(printPDF)
    window="maximized";
else
    window="normal";
end

fsize = 20;
arrowY = 2.8;

%% First and second OFDM symbols, perfectly aligned

f10 = 1.5*ones(length(tDelayFinal));
f11 = sin(2*pi*fc2*tFirstSymbol) + 1.5;
f12 = -sin(2*pi*fc2*tSecondSymbol) + 1.5;

f20 = -1.5*ones(length(tDelayFinal));
f21 = sin(2*pi*fc1*tFirstSymbol) - 1.5;
f22 = -sin(2*pi*fc1*tSecondSymbol) - 1.5;


figure(WindowState=window);
ax = axes();
h1=plot(tDelayFinal, f10, Color="black", LineWidth=2); hold on;
h2=plot(tFirstSymbol, f11, Color="blue", LineWidth=2, DisplayName="OFDM 1"); hold on;
h3=plot(tSecondSymbol, f12, Color="red", LineWidth=2, DisplayName="OFDM 2"); hold on;
h4=plot(tDelayFinal, f20, Color="black", LineWidth=2); hold on;
h5=plot(tFirstSymbol, f21, Color="blue", LineWidth=2); hold on;
h6=plot(tSecondSymbol, f22, Color="red", LineWidth=2); hold on;
legend([h2, h3], AutoUpdate="off", FontSize=fsize)

xlim([min(t), max(t)])
ylim([-3, 3.8]);
xticks(NaN);
yticks(NaN);

xline(0, LineWidth=2, LineStyle="-.", DisplayName="");
xline(tOFDM, LineWidth=2, LineStyle="-.");
xline(2*tOFDM, LineWidth=2, LineStyle="-.");

plotArrow(ax, [0, tOFDM], [arrowY, arrowY]);
plotArrow(ax, [tOFDM, 2*tOFDM], [arrowY, arrowY]);

text(tOFDM/2, arrowY, "Ventana DFT", FontSize=fsize, ...
    HorizontalAlignment="center", VerticalAlignment="bottom")
text(tOFDM*3/2, arrowY, "Ventana DFT", FontSize=fsize, ...
    HorizontalAlignment="center", VerticalAlignment="bottom")

if(printPDF)
    exportgraphics(gcf, 'cp/cp_normal.pdf', ContentType='vector')
end

%% First and second OFDM symbols, missaligned
figure(WindowState=window);

f10 = 1.5*ones(length(tDelayInitial));
f11 = sin(2*pi*fc2*tFirstSymbolDelayed) + 1.5;
f12 = -sin(2*pi*fc2*tSecondSymbolDelayed) + 1.5;

h1 = plot(tDelayInitial, f10, Color="black", LineWidth=2); hold on;
h2 = plot(tFirstSymbolDelayed, f11, Color="blue", LineWidth=2, DisplayName="OFDM 1"); hold on;
h3 = plot(tSecondSymbolDelayed, f12, Color="red", LineWidth=2, DisplayName="OFDM 2"); hold on;
h4 = plot(tDelayFinal, f20, Color="black", LineWidth=2); hold on;
h5 = plot(tFirstSymbol, f21, Color="blue", LineWidth=2); hold on;
h6 = plot(tSecondSymbol, f22, Color="red", LineWidth=2); hold on;
legend([h2, h3], AutoUpdate="off")

xlim([min(t), max(t)])
ylim([-3, 4]);
xticks(NaN);
yticks(NaN);

xline(0, LineWidth=2, LineStyle="-.", DisplayName="");
xline(tOFDM, LineWidth=2, LineStyle="-.");
xline(2*tOFDM, LineWidth=2, LineStyle="-.");

plotArrow(ax, [0, tOFDM], [arrowY, arrowY]);
plotArrow(ax, [tOFDM, 2*tOFDM], [arrowY, arrowY]);
text(tOFDM/2, arrowY, "Ventana DFT", FontSize=fsize, ...
    HorizontalAlignment="center", VerticalAlignment="bottom")
text(tOFDM*3/2, arrowY, "Ventana DFT", FontSize=fsize, ...
    HorizontalAlignment="center", VerticalAlignment="bottom")

if(printPDF)
    exportgraphics(gcf, 'cp/cp_delay.pdf', ContentType='vector')
end
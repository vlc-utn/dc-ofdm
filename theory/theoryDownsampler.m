%% Theory Downsampling
% In this file we go through the concepts of downsampling a signal
clc; clear; close all;

%% Parameters
printPDF = true;
f_sinc = 1;                             % Frequency of the sinc signal

f_phy = 10;                             % Symbol frequency
tSymbol = -2:1/f_phy:2-1/f_phy;         % Symbol time vector
N = 1024;                               % FFT samples
M = 4;                                  % Downsampling factor

f_ADC = f_phy*M;                        % Sampling frequency
ts = -2:1/f_ADC:2-1/f_ADC;              % Sampling time vector

fc = 5;

%% Plot parameters
if(printPDF)
    window = "maximized";
else
    window = "normal";
end

fsize = 48;         % FontSize for titles and axes labels
fsizeLine = 60;     % FontSize for annotations in graph

%% Signal representation
x = sinc(ts*f_sinc) + 2*rectangularPulse(ts).*cos(2*pi*11*ts);
[psd, f] = pwelch(x, rectwin(length(x)), [], N, f_ADC, "centered");

%%%%%%%%%%

figure(WindowState=window);

stem(ts, x, LineWidth=2, Marker="o", MarkerFaceColor="auto");

xlabel('Tiempo $[\mu s]$', FontSize=fsize ,Interpreter="latex");
ylabel('$x[n] = \textrm{sinc}[n] + z[n]$', FontSize=fsize, Interpreter="latex");
%title("Se\~{n}al de entrada", Interpreter="latex");

fontsize(gca, fsize, "points");
set(gca,'TickLabelInterpreter','latex');

xline(1/f_sinc, LineWidth=4, LineStyle="-.", Label='$\frac{1}{f_{sig}}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=fsizeLine, Interpreter='latex');

xline(-1/f_sinc, LineWidth=4, LineStyle="-.", Label='$-\frac{1}{f_{sig}}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=fsizeLine, Interpreter='latex');

grid on;

if(printPDF)
    exportgraphics(gcf, 'downsampler/downsampler_a.pdf', ContentType='vector')
end

%%%%%%%%%%%%
figure(WindowState=window);

plot(f, 10*log10(psd), LineWidth=2);

xlabel('Frecuencia $[MHz]$', FontSize=fsize, Interpreter="latex");
ylabel("PSD\{$x[n]$\} $[\frac{dB}{MHz}]$", FontSize=fsize, Interpreter="latex");
%title("PSD de la se\~{n}al de entrada", Interpreter="latex");

fontsize(gca, fsize, "points");
set(gca,'TickLabelInterpreter','latex');

xline(f_sinc/2, LineWidth=4, LineStyle="-.", Label='$\frac{f_{sig}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=fsizeLine, Interpreter='latex');

xline(-f_sinc/2, LineWidth=4, LineStyle="-.", Label='', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=fsizeLine, Interpreter='latex');

xline(f_phy/2, LineWidth=4, LineStyle="-.", Label='$\frac{f_{PHY}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=fsizeLine, Interpreter='latex');

xline(-f_phy/2, LineWidth=4, LineStyle="-.", Label='$-\frac{f_{PHY}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=fsizeLine, Interpreter='latex');

xline(max(f), LineWidth=4, LineStyle="-.", Label='$\frac{f_{DAC}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=fsizeLine, Interpreter='latex');

xline(min(f), LineWidth=4, LineStyle="-.", Label='$-\frac{f_{DAC}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=fsizeLine, Interpreter='latex');

xlim([-max(f), max(f)])
grid on;

xlim([-max(f), max(f)]);
grid on;

if(printPDF)
    exportgraphics(gcf, 'downsampler/downsampler_b.pdf', ContentType='vector')
end

%% Signal downsampled without LPF
% The signal is constructed with "L-1" zeros between samples
% According to the properties of the DFT:
% x[n/L] -> X(L*Omega)
% Which means that the frequency spectrum is going to be compressed by a
% factor of "L", and we should see "L/2" extra repetitions of the spectrum.
xDown = downsample(x, M);
[psd, f] = pwelch(xDown, rectwin(length(xDown)), [], N, f_phy, "centered");

%%%%%%%%%%%%%%%%%
figure(WindowState=window);

stem(tSymbol, xDown, LineWidth=2, Marker="o", MarkerFaceColor="auto");
xlabel("Tiempo $[\mu s]$", FontSize=fsize, Interpreter="latex");
ylabel('$x[n \cdot M_{down}]$', FontSize=fsize, Interpreter="latex");
%title('Se\~{n}al submuestreada con $M = 4$', Interpreter="latex");

fontsize(gca, fsize, "points");
set(gca,'TickLabelInterpreter','latex');

xline(1/f_sinc, LineWidth=4, LineStyle="-.", Label='$\frac{1}{f_{sig}}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=fsizeLine, Interpreter='latex');

xline(-1/f_sinc, LineWidth=4, LineStyle="-.", Label='$-\frac{1}{f_{sig}}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=fsizeLine, Interpreter='latex');

grid on;

if(printPDF)
    exportgraphics(gcf, 'downsampler/downsampler_c.pdf', ContentType='vector');
end

%%%%%%%%%%%%%%%
figure(WindowState=window);

plot(f, 10*log10(psd), LineWidth=2);
xlabel('Frecuencia $[MHz]$', FontSize=fsize, Interpreter="latex");
ylabel('PSD\{$x[n \cdot M_{down}]$\}  $[\frac{dB}{MHz}]$', FontSize=fsize, Interpreter="latex");
%title("PSD de la se\~{n}al submuestreada", Interpreter="latex");

fontsize(gca, fsize, "points");
set(gca,'TickLabelInterpreter','latex');

xline(f_sinc/2, LineWidth=4, LineStyle="-.", Label='$\frac{f_{sig}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=fsizeLine, Interpreter='latex');

xline(-f_sinc/2, LineWidth=4, LineStyle="-.", Label='$-\frac{f_{sig}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=fsizeLine, Interpreter='latex');


xline(f_phy/2, LineWidth=4, LineStyle="-.", Label='$\frac{f_{PHY}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=fsizeLine, Interpreter='latex');

xline(-f_phy/2, LineWidth=4, LineStyle="-.", Label='$-\frac{f_{PHY}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=fsizeLine, Interpreter='latex');

xlim([-max(f), max(f)])
grid on;

if(printPDF)
    exportgraphics(gcf, 'downsampler/downsampler_d.pdf', ContentType='vector')
end

%% Signal interpolated
% When applied a FIR lowpass filter, only the compressed spectrum remains.
xDecimated = resample(x, 1, M);
[psd, f] = pwelch(xDecimated, rectwin(length(xDecimated)), [], N, f_phy, "centered");

%%%%%%%%%%%%%%%%%%%%%%%%
figure(WindowState=window);
stem(tSymbol, xDecimated, LineWidth=2, Marker="o", MarkerFaceColor="auto");
xlabel('Tiempo $[\mu s]$', FontSize=fsize, Interpreter="latex");
ylabel("y[n] = LPF $\{x[n]\} [n \cdot M_{down}]$", FontSize=fsize, Interpreter="latex");
%title("Se\~{n}al decimada", Interpreter="latex");

fontsize(gca, fsize, "points");
set(gca,'TickLabelInterpreter','latex');

xline(1/f_sinc, LineWidth=4, LineStyle="-.", Label='$\frac{1}{f_{sig}}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=fsizeLine, Interpreter='latex');

xline(-1/f_sinc, LineWidth=4, LineStyle="-.", Label='$-\frac{1}{f_{sig}}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=fsizeLine, Interpreter='latex');

grid on;

if(printPDF)
    exportgraphics(gcf, 'downsampler/downsampler_e.pdf', ContentType='vector')
end

%%%%%%%%%%%%%%%%%%%%%%%%
figure(WindowState=window);

plot(f, 10*log10(psd), LineWidth=2);
xlabel('Frecuencia $[MHz]$', FontSize=fsize, Interpreter="latex");
ylabel('PSD $\{y[n]\}$  $[\frac{dB}{MHz}]$', FontSize=fsize, Interpreter="latex");
%title("PSD de la se\~{n}al decimada", Interpreter="latex");

fontsize(gca, fsize, "points");
set(gca,'TickLabelInterpreter','latex');

xline(-f_sinc/2, LineWidth=4, LineStyle="-.", Label='$-\frac{f_{sig}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=fsizeLine, Interpreter='latex');

xline(f_sinc/2, LineWidth=4, LineStyle="-.", Label='$\frac{f_{sig}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=fsizeLine, Interpreter='latex');

xline(f_phy/2, LineWidth=4, LineStyle="-.", Label='$\frac{f_{PHY}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=fsizeLine, Interpreter='latex');

xline(-f_phy/2, LineWidth=4, LineStyle="-.", Label='$-\frac{f_{PHY}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=fsizeLine, Interpreter='latex');

xlim([-max(f), max(f)])
grid on;

if(printPDF)
    exportgraphics(gcf, 'downsampler/downsampler_f.pdf', ContentType='vector')
end

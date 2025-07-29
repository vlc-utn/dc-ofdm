%% Theory Oversampling
% In this file we go through the concepts of upsampling a signal
clc; clear; close all;

%% Parameters
printPDF = true;
f_sinc = 1;                             % Frequency of the sinc signal

f_phy = 10;                             % Symbol frequency
tSymbol = -2:1/f_phy:2-1/f_phy;         % Symbol time vector
N = 1024;                               % FFT samples
L = 4;                                  % Upsampling factor

f_DAC = f_phy*L;                        % Sampling frequency
ts = -2:1/f_DAC:2-1/f_DAC;              % Sampling time vector

%% Plot parameters
fsize = 48;         % FontSize for titles and axes labels
fsizeLine = 60;     % FontSize for annotations in graph

if(printPDF)
    window="maximized";
else
    window="normal";
end

%% Signal representation
% The signal is represented with a certain amount of samples "tSymbol"
x = sinc(tSymbol*f_sinc);
[psd, f] = pwelch(x, rectwin(length(x)), [], N, f_phy, "centered", "psd");

%%%%%%%%%%

figure(WindowState=window);

stem(tSymbol, x, LineWidth=2, Marker="o", MarkerFaceColor="auto");

xlabel('Time $[\mu s]$', FontSize=fsize ,Interpreter="latex");
ylabel('$x[n] = \textrm{sinc}[n]$', FontSize=fsize, Interpreter="latex");
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

if (printPDF)
    pause(1)
    exportgraphics(gcf, 'upsampler/upsampler_a.pdf', ContentType='vector')
end

%%%%%%%%%%%%
figure(WindowState=window);

plot(f, 10*log10(psd), LineWidth=2);

xlabel('Frequency $[MHz]$', FontSize=fsize, Interpreter="latex");
ylabel("PSD\{$x[n]$\} $[\frac{dB}{Hz}]$", FontSize=fsize, Interpreter="latex");
%title("PSD de la se\~{n}al de entrada", Interpreter="latex");

fontsize(gca, fsize, "points");
set(gca,'TickLabelInterpreter','latex');

xline(f_sinc/2, LineWidth=4, LineStyle="-.", Label='$\frac{f_{sig}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=fsizeLine, Interpreter='latex');

xline(-f_sinc/2, LineWidth=4, LineStyle="-.", Label='$-\frac{f_{sig}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=fsizeLine, Interpreter='latex');

xline(max(f), LineWidth=4, LineStyle="-.", Label='$\frac{f_{PHY}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='left', FontSize=fsizeLine, Interpreter='latex');

xline(min(f), LineWidth=4, LineStyle="-.", Label='$-\frac{f_{PHY}}{2}$', ...
    LabelVerticalAlignment='bottom', LabelOrientation='horizontal', ...
    LabelHorizontalAlignment='right', FontSize=fsizeLine, Interpreter='latex');

xlim([-max(f), max(f)]);
grid on;

if(printPDF)
    pause(1)
    exportgraphics(gcf, 'upsampler/upsampler_b.pdf', ContentType='vector')
end

%% Signal upsampled with zeros
% The signal is constructed with "L-1" zeros between samples
% According to the properties of the DFT:
% x[n/L] -> X(L*Omega)
% Which means that the frequency spectrum is going to be compressed by a
% factor of "L", and we should see "L/2" extra repetitions of the spectrum.
xUp = upsample(x, L);
[psd, f] = pwelch(xUp, rectwin(length(xUp)), [], N, f_DAC, "centered");

%%%%%%%%%%%%%%%%%
figure(WindowState=window);

stem(ts, xUp, LineWidth=2, Marker="o", MarkerFaceColor="auto");
xlabel("Time $[\mu s]$", FontSize=fsize, Interpreter="latex");
ylabel('$x[n/L_{up}]$', FontSize=fsize, Interpreter="latex");
%title('Se\~{n}al sobremuestreada con $L = 4$', Interpreter="latex");

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
    pause(1)
    exportgraphics(gcf, 'upsampler/upsampler_c.pdf', ContentType='vector');
end

%%%%%%%%%%%%%%%
figure(WindowState=window);

plot(f, 10*log10(psd), LineWidth=2);
xlabel('Frequency $[MHz]$', FontSize=fsize, Interpreter="latex");
ylabel('PSD\{$x[n/L_{up}]$\}  $[\frac{dB}{Hz}]$', FontSize=fsize, Interpreter="latex");
%title("PSD de la se\~{n}al sobremuestreada", Interpreter="latex");

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

if(printPDF)
    pause(1)
    exportgraphics(gcf, 'upsampler/upsampler_d.pdf', ContentType='vector')
end

%% Signal interpolated
% When applied a FIR lowpass filter, only the compressed spectrum remains.
xIn = resample(x, L, 1);
[psd, f] = pwelch(xIn, rectwin(length(xIn)), [], N, f_DAC, "centered");

%%%%%%%%%%%%%%%%%%%%%%%%
figure(WindowState=window);
stem(ts, xIn, LineWidth=2, Marker="o", MarkerFaceColor="auto");
xlabel('Time $[\mu s]$', FontSize=fsize, Interpreter="latex");
ylabel("$y[n] = LPF\{x[n/L_{up}]\}$", FontSize=fsize, Interpreter="latex");
%title("Se\~{n}al interpolada", Interpreter="latex");

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
    pause(1)
    exportgraphics(gcf, 'upsampler/upsampler_e.pdf', ContentType='vector')
end

%%%%%%%%%%%%%%%%%%%%%%%%
figure(WindowState=window);

plot(f, 10*log10(psd), LineWidth=2);
xlabel('Frequency $[MHz]$', FontSize=fsize, Interpreter="latex");
ylabel('PSD\{$y[n]$\}  $[\frac{dB}{Hz}]$', FontSize=fsize, Interpreter="latex");
%title("PSD de la se\~{n}al interpolada", Interpreter="latex");

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

if(printPDF)
    pause(1)
    exportgraphics(gcf, 'upsampler/upsampler_f.pdf', ContentType='vector')
end

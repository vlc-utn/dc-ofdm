%% SVG Plot
% Return a SVG plot of any function, to later add effects in Inkscape

% t = 0:0.01:2;
% y1 = sin(2*pi*1*t) + 6;
% y2 = sin(2*pi*2*t) + 3;
% y3 = sin(2*pi*3*t) + 0;
% y4 = sin(2*pi*4*t) - 3;
% 
% figure(WindowState="maximized");
% plot(t, y1, LineWidth=2); hold on;
% plot(t, y2, LineWidth=2); hold on;
% plot(t, y3, LineWidth=2); hold on;
% plot(t, y4, LineWidth=2); hold on;
% 
% figure(WindowState="maximized");
% plot(t, y1 + y2 + y3 + y4, LineWidth=2);
% 
% exportgraphics(gcf, 'last_svg.pdf', ContentType='vector')

clc; clear; close all;

fs = 125e6;
fc = 50e6;

n = 1:1:100;

y = sin(2*pi*fc/fs*n);

plot(n, y)

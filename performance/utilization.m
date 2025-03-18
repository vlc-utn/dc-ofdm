%% UTILIZACION DE LA FPGA
% Este script plotea los gráficos de barras de utilización de recursos de 
% la FPGA
clc; clear; close all;

%% Parametros

fsize = 60;
fsizeLabel = 60;

% LUT | FF | BRAM | DSP
fpga = [17600, 35200, 60, 80];

%%% Primera iteracion
demod = [57310, 35567, 0, 80] ./ fpga * 100;
payload = [35298, 20736, 48, 0] ./ fpga * 100;
header = [6081, 4112, 7, 0] ./ fpga * 100;

%%% Depues de optimizar el demodulador
demod2 = [25565, 22402, 4, 76] ./ fpga * 100;
payload2 = [35544, 20732, 48, 0] ./ fpga * 100;
header2 = [6083, 4114, 7, 0] ./ fpga * 100;

%%% Despues de reducir el tamaño del LDCP de 16 bits a 4 bits
demod3 = [12349, 14382, 11, 76] ./ fpga * 100;
payload3 = [11199, 7031, 42, 0] ./ fpga * 100;
header3 = [2179, 1728, 7, 0] ./ fpga * 100;

%%% Valores finales Rx
demod4 = [11308 + 1741, 14862 + 3171, 19, 38+41] ./ fpga * 100;
decoder = [2785, 2553, 33, 0] ./ fpga * 100;

total_rx = [16126, 21175, 59, 79] ./ fpga * 100;

%%% Valores finales Tx
mod = [5478+3456, 7830 + 6063, 18, 13 + 44] ./ fpga * 100;
coder = [1699, 207, 18, 2] ./ fpga * 100;
total_tx = [11204, 16717, 60, 59] ./ fpga * 100;

%% Plots
bar_values{1} = [demod; payload; header]';
bar_values{2} = [demod2; payload2; header2]';
bar_values{3} = [demod3; payload3; header3]';

%bar_values{4} = [demod4; decoder; total_rx - demod4 - decoder];
%bar_values{5} = [mod; coder; total_tx - mod - coder];

bar_values{4} = [demod4; decoder; total_rx - demod4 - decoder];
bar_values{5} = [mod; coder; total_tx - mod - coder];

for i=1:1:length(bar_values)
    figure(windowState="maximized");
    x = ["LUT", "FF", "BRAM", "DSP"];
    b = bar(x, bar_values{i}, "stacked");
    
    % Legenda y limites
    if (i <= 3)
        lgd = legend("Demodulador", "Payload", "Header", FontSize=fsizeLabel, Interpreter='latex');
        lgd.Location = 'southwest';
    elseif (i == 4)
        lgd = legend("Demodulador", "Decodificador", "Interfaz", FontSize=fsizeLabel, Interpreter='latex');
        lgd.Location = 'southwest';
        ylim([0, 100]);
        xlabel("Recursos Rx (ZYNQ-7010)", FontSize=fsize, Interpreter='latex');
    elseif (i == 5)
        lgd = legend("Modulador", "Codificador", "Interfaz", FontSize=fsizeLabel, Interpreter='latex');
        lgd.Location = 'southwest';
        ylim([0, 100]);
        xlabel("Recursos Tx (ZYNQ-7010)", FontSize=fsize, Interpreter='latex');
    end

    % Agregar numero de porcentaje arriba de la barra
    xtips = b(1).XEndPoints;
    ytips = b(end).YEndPoints;
    labels = string(round(b(1).YData + b(2).YData + b(3).YData));
    for j=1:1:length(labels)
        labels(j) = sprintf("%s\\%%", labels(j));
    end
    text(xtips,ytips,labels,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom',Interpreter='latex');

    % Parametros globales de todos los plots
    ylabel("\% de utilizaci\'on", FontSize=fsize, Interpreter='latex')
    
    grid on;
    set(gca,'box','off')
    
    fontsize(gca, fsize, "points");
    set(gca,'TickLabelInterpreter','latex');

    exportgraphics(gcf, sprintf('graphs/utilization_%d.pdf', i), ContentType='vector')
end

close all;
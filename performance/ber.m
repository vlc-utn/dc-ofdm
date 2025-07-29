%% Test transmission and reception of text
% For this test, we will be add noise to the transmitted signal and will
% check for bits wrongly received (before the LDPC decoder, using the LLR value).
clc; clear; close all;
addpath("../src");
addpath("../inc");
addpath("../src/rx");
constants;

%% Parameters
plotCSV = true; % Read previous values, dont overwrite
parametersFile = "sampleParametersFile.m";
printPDF = true; % If "true", scv values will be read. If "false", new values will be generated
fsize = 32;

%msg = randomStr(2048);
%retries = 200; % These amount of messages will be sent for each SNR value
%SNR = (0:2:20)';
%PlosPnlos = [3, 5, 10, 20];

msg = randomStr(2048);
retries = 5; % These amount of messages will be sent for each SNR value
SNR = (0:2:20)';
PlosPnlos = [3 5 10 20];

BER = zeros(length(SNR), 1);
M = 4; % 4-QAM

delayIn = randi([40, 80], length(SNR), retries);

%% Message transmission
pBits = str2binl(msg);
[OFDMSignal, ~, ~, hLDPCTx, pLDPCTx] = fullTx(CONST, parametersFile, pBits);

SNRTimes = 10.^(SNR/10);
berTheory = 2/log2(M)*(1-1/sqrt(M))*erfc(sqrt(3/2*SNRTimes/(M-1)));

markers = {"square", "diamond", "o", "^"};
legendString = cell(length(PlosPnlos)+1, 1);
figure(WindowState="maximized");
semilogy(SNR, berTheory, LineStyle="--", LineWidth=2); hold on;
legendString{1} = "Theoretical AWGN";


for k=1:1:length(PlosPnlos)
    if (plotCSV == false)
        for i=1:1:length(SNR)
            for j=1:1:retries
                OFDMRx = channelSimulation(OFDMSignal, delayIn(i,j)*2, SNR(i), PlosPnlos(k));
                [pBitsRx, err, delayOut, frequencyOffsetOut, ...
                    ~,~,~,~,~,~,~,~,~,~,~,~, ...
                    hLDPCRx, pLDPCRx] = fullRx(CONST, OFDMRx);
        
                fprintf("%d / %d\n\n", (k-1)*length(SNR) + (i-1)*retries + j, ...
                    length(SNR)*retries*length(PlosPnlos));
        
                if (err)
                    % Not synchronized, output is garbage
                    BER(i, j) = 1;
                    continue;
                end
            
                % Convert LLR to hard decision bits
                pLDPCRx = pLDPCRx(:);
                pLDPCRx(pLDPCRx < 0) = -1;
                pLDPCRx(pLDPCRx > 0) = 0;
                pLDPCRx = pLDPCRx*-1;
                pLDPCRx = logical(pLDPCRx);
            
                hLDPCRx = hLDPCRx(:);
                hLDPCRx(hLDPCRx < 0) = -1;
                hLDPCRx(hLDPCRx > 0) = 0;
                hLDPCRx = hLDPCRx*-1;
                hLDPCRx = logical(hLDPCRx);
        
                txBits = [hLDPCTx; pLDPCTx];
                rxBits = [hLDPCRx; pLDPCRx];
            
                BER(i,j) = sum(txBits~=rxBits)/length(txBits);      
            end
        end
    else
        BER = readmatrix(sprintf("ber_values_paper/k%d.csv", PlosPnlos(k)));
    end
    %% Plotting
    semilogy(SNR, mean(BER, 2), ...
        LineWidth=2, Marker=markers{k}); hold on;
    
    xlabel("SNR [dB]", FontSize=fsize, Interpreter="latex")
    ylabel("BER", FontSize=fsize, Interpreter="latex")
    grid on;
    legendString{k+1} = sprintf("$K_r=%d dB$", PlosPnlos(k));
    
    fontsize(gca, fsize, "points");
    set(gca,'TickLabelInterpreter','latex');

    writematrix(BER, sprintf("ber_values_current/k%d.csv", PlosPnlos(k)));
    
end
lgd = legend(legendString);
lgd.Location = "southwest";
lgd.Interpreter="latex";

if (printPDF)
    exportgraphics(gcf, 'graphs/ber.pdf', ContentType='vector')
end

disp("Test Successfull!");

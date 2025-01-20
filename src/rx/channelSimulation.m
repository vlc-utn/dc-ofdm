function [signalOut] = channelSimulation(signalIn, delay, SNR, PlosPnlos)
%CHANNELSIMULATION Simulate a channel, adding:
% - A delay to the signal [in samples]. The delay in ofdm samples will be
% the half of this value, because the sampling frequency is the double.
% - AWGN noise.
arguments(Input)
    signalIn (:, 1) double
    delay double            % [samples]
    SNR double = 120        % [dB]
    PlosPnlos double = 0    % [dB]
end
arguments(Output)
    signalOut (:, 1) double
end
    if (PlosPnlos ~= 0)
        k = 10^(PlosPnlos/10);
        u = sqrt(k/(2*(k+1)));      % Mean of normal distribution
        sigma = sqrt(1/(2*(k+1)));  % Standard devaiton of normal distribution
    end

    signalOut = [zeros(delay, 1); signalIn];
    if (PlosPnlos ~= 0)
        h_c = (sigma*randn(size(signalOut)) + u) + 1i*(sigma*randn(size(signalOut)) + u);
        signalOut = signalOut .* abs(h_c);
    end
    signalOut = awgn(signalOut, SNR, 'measured');
end


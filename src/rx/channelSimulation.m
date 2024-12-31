function [signalOut] = channelSimulation(signalIn, delay, SNR)
%CHANNELSIMULATION Simulate a channel, adding:
% - A delay to the signal [in samples]. The delay in ofdm samples will be
% the half of this value, because the sampling frequency is the double.
% - AWGN noise.
arguments(Input)
    signalIn (:, 1) double
    delay double        % [samples]
    SNR double = 120    % [dB]
end
arguments(Output)
    signalOut (:, 1) double
end
    signalOut = [zeros(delay, 1); signalIn];
    signalOut = awgn(signalOut, SNR, 'measured');
end


function [dataOut] = constellationScrambler(dataIn, isPreamble)
%CONSTELLATIONSCRAMBLER  LFSR Fibonacci with the polinomial 
% X^13 + X^12 + X^11 + X^8 + 1. The phase of the input data is shifted
% acorting to the two LSB results of this LFSR.
% Args:
%   - dataIn = Binary vector with data to be scrambled.
%   - isPreamble = If "true", the LFSR is initalized with 0x16E6 (LSB
%   first). If "false", it's initialized with 0x1FFF.
%   LFSR
% Output:
%   - dataOut = dataIn*i^(x), with "x" the two LSB of the LFSR.
arguments(Input)
    dataIn (:,1) double
    isPreamble logical
end
arguments(Output)
    dataOut (:,1) double
end
    if(isPreamble)
        % 0x16E6 = 0b1011011100110, but LSB first
        init = uint8([0 1 1 0 0 1 1 1 0 1 1 0 1]);
    else
        init = ones(1, 13);
    end

    % Matlab implementation is mirrored, so the polinomial is:
    % x^13 + x^12 + x^11 + x^8 + 1 --> X^13 + x^5 + x^2 + x^1 + 1
    % For more info, check "Additive Scrambling of Input Data" in the
    % "comm.PNSequence" Matlab documentation
    poly = [13 5 2 1 0];

    pnSeq = comm.PNSequence(Polynomial=poly, InitialConditions=init, Mask=13, ...
        SamplesPerFrame=length(dataIn)*2, OutputDataType="logical");

    LSB = pnSeq();

    % The values returned from the LFSR are like this:
    % [1 2 3 4 5 6 7 8]
    % But what we want is this (two bits advanced per subcarrier, the first
    % bit read is the LSB)
    % [21 43 65 87]
    LSB = 2*LSB(1:2:end) + LSB(2:2:end);
    dataOut = dataIn.*(1i.^LSB);
end
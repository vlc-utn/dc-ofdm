function [dataOut] = LDPCDecoder(dataIn, codeRate, blockSize, isHeader)
%LDPCDECODER Inverse operation to LDPCEncoder.
arguments(Input)
    dataIn (:,1)
    codeRate uint32
    blockSize uint32
    isHeader logical
end
arguments(Output)
    dataOut (:,1) logical
end
    ldpc;   %inc/ldpc
    %% Choosing the right LPDC parity check matrix
    if (isHeader)
        h = Hc_12H;
        B = 14;
    else
        switch codeRate
            case 1
                if (blockSize == 0)
                    % 1/2, 960
                    h = Hc_12S;
                    B = 80;
                else
                    % 1/2, 4320
                    h = Hc_12L;
                    B = 360;
                end
            case 2
                if(blockSize == 0)
                    % 2/3, 960
                    h = Hc_23S;
                    B = 60;
                else
                    % 2/3, 4320
                    h = Hc_23L;
                    B = 270;
                end
            case 3
                if(blockSize == 0)
                    % 5/6, 960
                    h = Hc_56S;
                    B = 48;
                else
                    % 5/6, 4320
                    h = Hc_56L;
                    B = 216;
                end
            case 4
                if(blockSize == 0)
                    % 16/18, 960
                    h = Hc_56S;
                    B = 48;
                else
                    % 16/18, 4320
                    h = Hc_56L;
                    B = 216;
                end
        
            case 5
                if (blockSize == 0)
                    % 20/21, 960
                    h = Hc_56S;
                    B = 48;
                else
                    % 20/21, 4320
                    h = Hc_56L;
                    B = 216;
                end
        end
    end
    
    h = ldpcQuasiCyclicMatrix(B, h);
    ldpcConfig = ldpcDecoderConfig(h);
    dataOut = ldpcDecode(single(dataIn), ldpcConfig, ldpcDecoderMaxNumberIterations);
end

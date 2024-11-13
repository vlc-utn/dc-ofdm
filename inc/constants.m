%% Constants
% This file contains all constants that never change for the transmitter or
% receiver. Most of these values are fixated by the standard.
ldpc;

%% General
CONST.N = 256;                                % Number of subcarriers.
CONST.Guard = 40;
CONST.leftGuard = (1:1+CONST.Guard)';
CONST.rightGuard = (CONST.N+1-CONST.Guard:CONST.N)';
CONST.nullIdx = [CONST.leftGuard; CONST.rightGuard];      % Carriers that are unused [1;nfft] == [-nfft/2*fsc; (nfft/2-1)*fsc] 
CONST.numDataCarriers = CONST.N - length(CONST.nullIdx);  % Amount of subcarriers with actual data.
if(CONST.numDataCarriers < 168)
    error("A minimum of 168 data carriers are needed to transmit the header in a single OFDM symbol!");
end

% This parameter is only used in the matlab reference algorithm. It adds
% zeroes only at the end of the transmission, to avoid a bug where the
% calculated delay might be more than the actual delay, and the ofdm
% demodulator fails for wrong size.
CONST.simTimeWindowInSamples = CONST.N/4;
CONST.OFDMSymbolDuration = 5120e-9;           % OFDM Symbol duration [seconds]

%% Preamble
CONST.preambleScramblerInit = uint8([0 1 1 0 0 1 1 1 0 1 1 0 1]);     % 0x16E6 = 0b1011011100110, but LSB first 
CONST.preambleBitsPerSubcarrier = 1;
CONST.preambleCyclicPrefixLen = 0;    % TODO if this values is "0", as it should be, the Simulink block breaks
CONST.preambleOFDMSymbols = preambleGenerate(CONST.nullIdx);
CONST.preambleLUT = CONST.preambleOFDMSymbols(:);
CONST.preambleDuration = CONST.OFDMSymbolDuration*width(CONST.preambleOFDMSymbols);
CONST.preambleDataCarriers = CONST.numDataCarriers*14;
CONST.preambleOFDMSamples = (CONST.N + CONST.preambleCyclicPrefixLen)*14;
CONST.preambleFirstPartOFDMSamples = (CONST.N + CONST.preambleCyclicPrefixLen)*10;
CONST.preambleSecondPartOFDMSamples = (CONST.N + CONST.preambleCyclicPrefixLen)*4;

%% Channel Estimation
CONST.channelScramblerInit = uint8([1 0 1 0 0 0 0 0 1 0 0 0 1]);      % 0x1105 = 0b1000100000101, but LSB first
CONST.channelBitsPerSubcarrier = 1;
CONST.channelCyclicPrefixLen = CONST.N/4; % 2.5 OFDM symbols for channel estimation means a quarter of cyclic prefix
CONST.channelOFDMSymbols = channelEstimationGenerate(CONST.nullIdx);
CONST.channelLUT = CONST.channelOFDMSymbols(:);
CONST.channelDuration = CONST.OFDMSymbolDuration*2.5;
CONST.channelDataCarriers = CONST.numDataCarriers*2;
CONST.channelOFDMSamples = (CONST.N + CONST.channelCyclicPrefixLen)*2;
CONST.channelEstReference = pskmod(CONST.channelOFDMSymbols(:,1), 2^CONST.channelBitsPerSubcarrier, PlotConstellation=false, InputType='bit');

%% Header
CONST.headerCRCPoly = logical([1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 1]);
CONST.headerScramblerInit = uint8([1 1 1 1 1 1 1 1 1 1 1 1 1]); % 0x1FFF
CONST.headerBitsPerSubcarrier = 2;  % BAT 1, 2 bits per subcarrier
CONST.headerCyclicPrefixLen = CONST.N/4;  % Fixed by standard
CONST.headerBitsPerFec = 336;
CONST.headerBitsPerOFDMSymbol = CONST.headerBitsPerSubcarrier*CONST.numDataCarriers;
CONST.headerDuration = CONST.OFDMSymbolDuration*1.25;
CONST.headerDataCarriers = CONST.numDataCarriers;
CONST.headerOFDMSamples = (CONST.N + CONST.headerCyclicPrefixLen)*1;

% Matlab implementation is mirrored, so the polinomial is:
% x^23 + x^18 + 1 --> X^23 + x^5 + 1
% For more info, check "Additive Scrambling of Input Data" in the
% "comm.PNSequence" Matlab documentation
CONST.headerScramblerPoly = [23 5 0];
CONST.headerBitScramblerInit = [0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0];

%% Payload
CONST.payloadBitsPerBlock0 = 168; % Same as header
CONST.payloadBitsPerBlock1 = 4320;
CONST.axiWidth = 8;
CONST.payloadWordsPerBlock0 = CONST.payloadBitsPerBlock0/CONST.axiWidth;
CONST.payloadWordsPerBlock1 = CONST.payloadBitsPerBlock1/CONST.axiWidth;
CONST.payloadBitsPerFec = 336;   % Same as header 
CONST.payloadScramblerInit = uint8([1 1 1 1 1 1 1 1 1 1 1 1 1]); % 0x1FFF

% Matlab implementation is mirrored, so the polinomial is:
% x^23 + x^18 + 1 --> X^23 + x^5 + 1
% For more info, check "Additive Scrambling of Input Data" in the
% "comm.PNSequence" Matlab documentation
CONST.payloadScramblerPoly = [23 5 0];

% The rest of parameters of the payload are defined in the file
% "parameters"


%% Modulator
CONST.fPHY = 62.5e6;                    % [Hz] Fixed by standard
CONST.oversamplingFactor = 2;
CONST.fs = CONST.fPHY*CONST.oversamplingFactor;   % [Hz] Sampling frequency, which will be the input of the DAC and ADC
CONST.fDAC = 125e6;
CONST.fADC = CONST.fDAC;

%% Tx Interpolator FIR filter
CONST.txL = 2;                                  % Upsampling factor for interpolator.
CONST.txInterpolatorFpass = 21.5e6;               % Passband frequency [Hz]
CONST.txInterpolatorFstop = 31.25e6;               % Stopband frequency [Hz]
CONST.txInterpolatorPassbandRippleDb = 0.02;    % Passband ripple [dB]
CONST.txInterpolatorStopbandAttDb = 80;         % Stopband attenuation [dB]

CONST.txInterpolatorSpec = fdesign.interpolator(CONST.txL, ...
    'lowpass','Fp,Fst,Ap,Ast', ...
    CONST.txInterpolatorFpass, ...
    CONST.txInterpolatorFstop, ...
    CONST.txInterpolatorPassbandRippleDb, ...
    CONST.txInterpolatorStopbandAttDb, ...
    CONST.fPHY*CONST.txL);
CONST.txInterpolatorFilter = design(CONST.txInterpolatorSpec,'SystemObject',true);

CONST.txInterpolatorDelay = mean(grpdelay(CONST.txInterpolatorFilter));
if (CONST.txInterpolatorDelay ~= round(CONST.txInterpolatorDelay))
    CONST.txInterpolatorDelay
    error("txInterpolatorDelay should be an integer!");
end

CONST.txInterpolatorMinFpass = (CONST.N/2 - CONST.Guard -1)*CONST.fPHY/CONST.N;
CONST.txInterpolatorMaxFstop = (CONST.N/2 + CONST.Guard +1)*CONST.fPHY/CONST.N;

if (CONST.txInterpolatorFpass < CONST.txInterpolatorMinFpass)
    disp(CONST.txInterpolatorMinFpass);
    error("Tx Interpolator minimum Fpass not met!");
elseif (CONST.txInterpolatorFstop > CONST.txInterpolatorMaxFstop)
    disp(CONST.txInterpolatorFstop);
    error("Tx Interpolator maximum Fpass exceded!");
end

% Uncomment to plot filter response
%CONST.txInterpolatorDelay
%fvtool(CONST.txInterpolatorFilter,'Fs', CONST.fPHY*CONST.txL);


%% Upshifter NCO (Numerical Controlled Oscillator)
% These equations were taking from the "help" section of the NCO block.
CONST.ncoUpFrequencyResolution = 10e3;         % Frequency resolution for the NCO
CONST.ncoUpCarrierFrequency = CONST.fPHY/2;       % Carrier frequency of the NCO
CONST.ncoUpSFDR = 80;                       % Spurious free dynamic range [dB]

CONST.ncoUpWordLength = ceil(log2(CONST.fDAC/CONST.ncoUpFrequencyResolution));
CONST.ncoUpQuantization = ceil((CONST.ncoUpSFDR-12)/6);
CONST.ncoUpCarrierPhaseIncrement = ...
    round(CONST.ncoUpCarrierFrequency/CONST.fDAC*2^CONST.ncoUpWordLength);
CONST.ncoUpActualFreq = ...
    CONST.ncoUpCarrierPhaseIncrement*CONST.fDAC/(2^CONST.ncoUpWordLength);

%% Downshifter NCO
% These equations were taking from the "help" section of the NCO block.
CONST.ncoFrequencyResolution = 10;        % Frequency resolution for the NCO
CONST.ncoCarrierFrequency = CONST.fPHY/2;       % Carrier frequency of the NCO
CONST.ncoSFDR = 80;                       % Spurious free dynamic range [dB]

CONST.ncoWordLength = ceil(log2(CONST.fADC/CONST.ncoFrequencyResolution));
CONST.ncoQuantization = ceil((CONST.ncoSFDR-12)/6);
CONST.ncoCarrierPhaseIncrement = ...
    round(CONST.ncoCarrierFrequency/CONST.fADC*2^CONST.ncoWordLength);

%% Decimator LPF filter
CONST.rxM = 2;
CONST.rxDecimatorFpass = 25e6;              % Passband frequency [Hz]
CONST.rxDecimatorFstop = 33.5e6;            % Stopband frequency [Hz]
CONST.rxDecimatorPassbandRippleDb = 0.29;   % Passband ripple [dB]
CONST.rxDecimatorStopbandAttDb = 60;        % Stopband attenuation [dB]

CONST.rxDecimatorSpec = fdesign.decimator(CONST.rxM, 'lowpass', 'Fp,Fst,Ap,Ast', ...
    CONST.rxDecimatorFpass, ...
    CONST.rxDecimatorFstop, ...
    CONST.rxDecimatorPassbandRippleDb, ...
    CONST.rxDecimatorStopbandAttDb, ...
    CONST.fADC);
CONST.rxDecimatorFilter = design(CONST.rxDecimatorSpec, 'equiripple', 'SystemObject',true);

% Group delay of the filter should be even.
CONST.rxDecimatorDelay = mean(grpdelay(CONST.rxDecimatorFilter));
if (mod(CONST.rxDecimatorDelay, 2) ~= 0)
    disp(CONST.rxDecimatorDelay);
    error("decimatorDelay should be even!");
end

% Uncomment to plot filter response
%fvtool(CONST.rxDecimatorFilter,'Fs', CONST.fADC);

%% QAM constellations
CONST.qamTwoBits = [3, 2, 1, 0];
CONST.qamFourBits = [2, 3, 1, 0, 6, 7, 5, 4, 14, 15, 13, 12, 10, 11, 9, 8];

%% Peak detector
CONST.peakDetectorWindow = 128;
CONST.peakDetectorThreshold = 0.65;
CONST.frequencyOffsetTimeWindow = CONST.preambleFirstPartOFDMSamples/CONST.fPHY;

%% Simulink model constants
CONST.DACDataType = fixdt(1, 14, 13);
CONST.ADCDataType = fixdt(1, 14, 13);
CONST.ipCoreDataType = fixdt(1, 14, 13);

% Memory used from this ram will be: 2*2^CONST.txRAMAddressBitWidth
CONST.txRAMAddressBitWidth = 16;

% Values for up to 4096 of payload message
CONST.FIFOOFDMSize = 1200;   % Maximum value = 1091
CONST.FIFORxPayloadSize = 32768;

% Amount of cycles to wait before starting to read the FIFO (this is made
% so that there are enough values for the LDPC decoder in one go.
CONST.rxDelayBeforeReadingFIFOPayload = 600; % 600 Number tested, don't change.

CONST.txQAMDataType = fixdt(1,16,14);

CONST.txInterpolatorCoefficientsDataType = fixdt(1,20,16);
CONST.txInterpolatorOutputDataType = fixdt(1,20,16);

CONST.txNCOWordLength = 20;
CONST.txNCOFractionLength = 16;

CONST.rxDemodInputDataType = fixdt(1,14,13);

CONST.rxNCOWordLength = 16;
CONST.rxNCOFractionLength = 14;

% Number is = 2^(CONST.ncoWordLength-1)/CONST.preambleFirstPartOFDMSamples
CONST.rxFreqOffsetWordLength = 20; CONST.rxFreqOffsetFractionLength = 8;
CONST.rxPhaseDataType = fixdt(1,16,15);

CONST.rxDecimatorCoefficientsDataType = fixdt(1,16);
CONST.rxDecimatorOutputDataType = fixdt(1,16,14);

% Data type for the input of the OFDM_SS
CONST.rxOFDMSSInputDataType = fixdt(1,16,10);

% Data type for DSP48 25*18 in R and P of the OFDM_SS
CONST.dsp48A = fixdt(1,25,15);
CONST.dsp48B = fixdt(1,18,8);

% This data type is the one used as input for the divider in the OFDM_SS
CONST.rxRWordLength = 24;
CONST.rxRFractionLength = 10;
CONST.rxRDividerDelay = 11 + CONST.rxRWordLength + nextpow2(CONST.rxRWordLength+1);

% Output data type of the divider
CONST.rxMDataType = fixdt(1,16,14);

% This data type is the one used as input for the phase calculation
CONST.rxPDataType = fixdt(1,20,10);

CONST.rxOFDMDemodDataType = fixdt(1,18,12);

CONST.rxChannelEstReferenceWordLength = 18;
CONST.rxChannelEstReferenceFractionLength = 12;
CONST.rxChannelEstDividerDelay = 10 + CONST.rxChannelEstReferenceWordLength + nextpow2(CONST.rxChannelEstReferenceWordLength);

CONST.rxQAMDemodDataType = fixdt(1,4,1);

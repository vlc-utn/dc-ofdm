%% Test Tone Mapper
% The tone mapper takes "n start" control signals and only outputs an "end"
% when the whole frame is transmitted. This block allows spaces with "no
% valid" in between several "starts".
clc; clear; close all;
addpath("../../src/")
addpath("../../inc/");
constants;

%% Inputs
delay = false(200, 1);

ofdmSymbols{1} = 1;
bitsPerSubcarrierX{1} = 1;
input{1} = logical(randi([0 1], CONST.numDataCarriers*ofdmSymbols{1}, 1));
expectedOut{1} = input{1};

ofdmSymbols{2} = 3;
bitsPerSubcarrierX{2} = 1;
input{2} = logical(randi([0 1], CONST.numDataCarriers*ofdmSymbols{2}, 1));
expectedOut{2} = input{2};

ofdmSymbols{3} = 1;
bitsPerSubcarrierX{3} = 1;
input{3} = logical(randi([0 1], CONST.numDataCarriers*ofdmSymbols{3} - 25, 1));
expectedOut{3} = [input{3}; false(25, 1)];

ofdmSymbols{4} = 188;
bitsPerSubcarrierX{4} = 2;
input{4} = logical(randi([0 1], CONST.numDataCarriers*ofdmSymbols{4}*bitsPerSubcarrierX{4} - 72, 1));
expectedOut{4} = [input{4}; false(72, 1);]; 

ofdmSymbols{5} = 2;
bitsPerSubcarrierX{5} = 4;
input{5} = logical(randi([0 1], CONST.numDataCarriers*ofdmSymbols{5}*bitsPerSubcarrierX{5} - 155, 1));
expectedOut{5} = [input{5}; false(155, 1);];

% Next symbols are gonna be spread over multiple "start - end" cycles.
ofdmSymbols{6} = 3;
bitsPerSubcarrierX{6} = 2;
input{6} = [
    true(CONST.numDataCarriers*bitsPerSubcarrierX{6}, 1);
    delay;
    true(CONST.numDataCarriers*bitsPerSubcarrierX{6}, 1);
    delay;
    true(CONST.numDataCarriers*bitsPerSubcarrierX{6} - 65, 1);
];
expectedOut{6} = [
    true(CONST.numDataCarriers*bitsPerSubcarrierX{6}, 1);
    true(CONST.numDataCarriers*bitsPerSubcarrierX{6}, 1);
    true(CONST.numDataCarriers*bitsPerSubcarrierX{6} - 65, 1); false(65, 1);
];

ofdmSymbols{7} = 4;
bitsPerSubcarrierX{7} = 2;
a = logical(randi([0 1], CONST.numDataCarriers*bitsPerSubcarrierX{7}, 1));
b = logical(randi([0 1], CONST.numDataCarriers*bitsPerSubcarrierX{7}, 1));
c = logical(randi([0 1], CONST.numDataCarriers*bitsPerSubcarrierX{7}, 1));
d = logical(randi([0 1], CONST.numDataCarriers*bitsPerSubcarrierX{7} - 44, 1));
input{7} = [a; delay; b; delay; c; delay; d;];
expectedOut{7} = [a; b; c; d; false(44, 1);];


validIn = [
    true(size(input{1}));
    delay;
    true(size(input{2}));
    delay;
    true(size(input{3}));
    delay;
    true(size(input{4}));
    delay;
    true(size(input{5}));
    delay;
    logical(input{6});
    delay;
    true(CONST.numDataCarriers*bitsPerSubcarrierX{7}, 1); delay;
    true(CONST.numDataCarriers*bitsPerSubcarrierX{7}, 1); delay;
    true(CONST.numDataCarriers*bitsPerSubcarrierX{7}, 1); delay;
    true(CONST.numDataCarriers*bitsPerSubcarrierX{7} - 44, 1);
    delay;
];

dataIn = [
    input{1};
    delay;
    input{2};
    delay;
    input{3};
    delay;
    input{4};
    delay;
    input{5};
    delay;
    input{6};
    delay;
    input{7};
];

bitsPerSubcarrier = [
    repmat(bitsPerSubcarrierX{1}, size(input{1}));
    repmat(bitsPerSubcarrierX{2}, size(input{2}));
    repmat(bitsPerSubcarrierX{3}, size(input{3}));
    repmat(bitsPerSubcarrierX{4}, size(input{4}));
    repmat(bitsPerSubcarrierX{5}, size(input{5}));
    repmat(bitsPerSubcarrierX{6}, CONST.numDataCarriers*bitsPerSubcarrierX{6}*ofdmSymbols{6}-65, 1);
    repmat(bitsPerSubcarrierX{7}, CONST.numDataCarriers*bitsPerSubcarrierX{7}*ofdmSymbols{7}-44, 1);
];

payloadLenInOFDMSymbols = [
    repmat(ofdmSymbols{1}, size(input{1}));
    repmat(ofdmSymbols{2}, size(input{2}));
    repmat(ofdmSymbols{3}, size(input{3}));
    repmat(ofdmSymbols{4}, size(input{4}));
    repmat(ofdmSymbols{5}, size(input{5}));
    repmat(ofdmSymbols{6}, CONST.numDataCarriers*bitsPerSubcarrierX{6}*ofdmSymbols{6}-65, 1);
    repmat(ofdmSymbols{7}, CONST.numDataCarriers*bitsPerSubcarrierX{7}*ofdmSymbols{7}-44, 1);
];

newFrame = [
    true;
    false(length(input{1})-1 -44, 1); % 44 is a random delay after the "newFrame" signal
    delay;
    true;
    false(44, 1);
    false(length(input{2})-1-87, 1);
    delay;
    true;
    false(87, 1);
    false(length(input{3})-1, 1);
    delay;
    true;
    false(length(input{4})-1, 1);
    delay;
    true;
    false(length(input{5})-1, 1);
    delay;
    true;
    false(length(input{6})-41, 1);
    delay;
    true;
    false(41, 1);
    delay;
];

%% Simulation time
fs = 1;             % Output sample frequency
latency = 1000;        % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fs + latency;

%% Run the simulation
model_name = "HDLToneMapping";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
validOut = get(simOut, "validOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");

%% Compare with MATLAB reference algorithm
startIdx = find(startOut == true);
endIdx = find(endOut == true);

% Make sure that start and end have the same size
assert(isequal(length(startIdx), length(endIdx)), "Start and end indexes should be the same");

for i=1:length(endIdx)
    out = dataOut(startIdx(i):endIdx(i));
    valid = validOut(startIdx(i):endIdx(i));
    out = out(valid == true);
    assert(isequal(out, expectedOut{i}));
end

disp("Simulation successful!");

%% Transmitter
% This file contains a fully functional transmitter.
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Input
simulinkFile = "HDLTxRx";
createVivadoFile = false;
paramFile = "sampleParametersFile";
%msgIn{1} = ['This is an example message used to test the transmitter. ' ...
%   'It is made large on purpose to test for a large message being ' ...
%   'transmitted'];
%msgIn{1} = randomStr(4096);
msgIn{1} = randomStr(2000);
msgIn{2} = randomStr(2000);
%msgIn{3} = randomStr(100);
%msgIn{4} = randomStr(100);

if (createVivadoFile)
    % Only one message
    a = msgIn{1}; msgIn = cell(1,1); msgIn{1} = a;
end

msgQtty = length(msgIn);

pWords = [];
validIn = [];
lastIn = [];
for i=1:1:length(msgIn)
    pBitsRaw{i} = str2binl(msgIn{i});
    pBits{i} = getPayloadParamsFromBits(CONST, pBitsRaw{i});
    pWords = [pWords binl2str(pBits{i})];
    len = length(binl2str(pBits{i}));
    validIn = [validIn; true(len, 1);];
end

validReg = true(length(msgIn), 1);
newFrame = true;

%% Expected Output
expectedOut = cell(length(msgIn), 1);
payloadOFDMSymbols = cell(length(msgIn), 1);
reg0 = zeros(length(msgIn), 1);
reg1 = zeros(length(msgIn), 1);
reg2 = zeros(length(msgIn), 1);
reg3 = zeros(length(msgIn), 1);

for i=1:1:length(msgIn)
    [reg0(i,1), reg1(i,1), reg2(i,1), reg3(i,1)] = param2regs(CONST, paramFile, pBitsRaw{i});
end

%% Simulation Time
stopTime = 10e-3;

%% Run the simulation
load_system(simulinkFile);
simOut = sim(simulinkFile);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

headerEndOut = get(simOut, "headerEndOut");
headerErrOut = get(simOut, "headerErrOut"); % Not used

reg0Out = get(simOut, "reg0Out");
reg1Out = get(simOut, "reg1Out");
reg2Out = get(simOut, "reg2Out");
reg3Out = get(simOut, "reg3Out");

%% Compare header
headerEndOutIdx = find(headerEndOut == true);

assert(~isempty(headerEndOutIdx), ...
    "headerEndOutIdx shouldn't be empty");
assert(isequal(length(headerEndOutIdx), msgQtty), ...
    "There should be the same amount of headers received than messages sent.");

for i=1:1:length(headerEndOutIdx)
    assert(isequal(reg0Out(headerEndOutIdx(i)), reg0(i,1)));
    assert(isequal(reg1Out(headerEndOutIdx(i)), reg1(i,1)));
    assert(isequal(reg2Out(headerEndOutIdx(i)), reg2(i,1)));
    assert(isequal(reg3Out(headerEndOutIdx(i)), reg3(i,1)));
end
disp("Header was read correctly!");

%% Compare payload
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(~isempty(startIdx), ...
    "StartIdx shouldn't be empty");
assert(isequal(length(startIdx), length(endIdx)), ...
    "Start and end should be of the same size");
assert(isequal(length(startIdx), msgQtty), ...
    "Amount of received fec blocks should be the same as sent");

for i=1:1:msgQtty
    out = dataOut(startIdx(i):endIdx(i));
    valid = validOut(startIdx(i):endIdx(i));
    out = out(valid == 1);
    msgOut = char(out)';
    assert(isequal(msgOut, msgIn{i}), "Sent and received message should be the same!");
end

%% Create Vivado data file for VHDL testbench
if (createVivadoFile)
    % Generate input file
    fileName = "data_in.mem";
    % The signal already has a "*2" in it, so multiply by 2^13, because the
    % input should be a fixdt(1, 14, 13)
    input = dataIn*2^13;
    input = {input;};
    bitLen = 16;
    header = "dataIn";
    createVivadoDataFile(fileName, input, bitLen, header, ",");
    
    % Generate output file
    fileName = "data_out.mem";
    fileOut = {uint8(msgOut');};
    bitLen = 8;
    header = "dataOut";
    createVivadoDataFile(fileName, fileOut, bitLen, header, ",");
    disp("Vivado memory files generated!");
end

disp("Test successfull!");


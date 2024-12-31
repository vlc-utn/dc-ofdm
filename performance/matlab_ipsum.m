function[t] = matlab_ipsum(varargin)
%MATLAB_IPSUM  generate random filler text
%
%USAGE:
%   t = matlab_ipsum('Property1', Value1, 'Property2', Value2, ..., 'PropertyN', ValueN);
%
%INPUTS:
%   An (optional) sequence of Property-value pairs:
%   
%    + Paragraphs: The number of paragraphs to generate. (Default: 3)
%    + Sentences: The mean number of sentences to write per paragraph.
%      (Default: 4)
%    + SentencesStd: Standard deviation of number of sentences/paragraph.
%      (Default: 1)
%    + Words: The mean number of words per sentence.  (Default: 8)
%    + WordsStd: Standard deviation of number of words/sentence.
%      (Default: 2)
%    + WordLength: The mean word length (number of characters).
%      (Default: 6)
%    + WordLengthStd: Standard deviation of word length.  (Default: 2)
%    + VowelsProp: Proportion of vowels per word.  (Default: 0.5)
%    + PunctuationProp: Proportion of words followed by punctuation.
%      (Default: 0.05)
%
%OUTPUTS:
%
%         t: A formatted text string.
%
%EXAMPLE USAGE:
%
%   %Save output in filler.txt in the current working directory   
%   fid = fopen('filler.txt', 'w+');
%   fprintf(fid, matlab_ipsum('Paragraphs',20,'Sentences',5));
%   fclose(fid);
%
%SEE ALSO: FPRINTF

% 9/9/13   JRM     Wrote it.
% 9/12/13  JRM     Select characters according to English letter frequency

%#ok<*AGROW>
end_punctuation = ['.' '!' '?'];
end_punctuation_props = [0.9 0.05 0.05];
punctuation = [',' ';' ':'];
punctuation_props = [0.8 0.1 0.1];

args = parse_args(varargin{:});

t = [];
for i = 1:round(args.Paragraphs)
    numSentences = max(round(args.SentencesStd*randn + args.Sentences), 1);
    for j = 1:numSentences
        numWords = max(round(args.WordsStd*randn + args.Words), 1);
        t = [t, capitalize(generate_word(args))]; 
        for k = 2:numWords
            if (rand < args.PunctuationProp) && (k < numWords)
                t = [t, slctrnd(punctuation, punctuation_props)];
            end
            t = [t, ' ', generate_word(args)];            
        end
        t = [t, slctrnd(end_punctuation, end_punctuation_props), '  '];
    end
    if i == round(args.Paragraphs)
        t = t(1:end-2);
    else
        t = [t, '\n\n'];
    end
end

function[s] = capitalize(s)
s(1) = upper(s(1));

function[w] = generate_word(a)
letters = char((0:25) + 'a');
vowels = 'aeiou';
consonants = letters(~ismember(letters, vowels));

%source: http://en.wikipedia.org/wiki/Letter_frequency
freqs = [8.1670 1.4920 2.7820 4.2530 12.7020 2.2280 2.0150 6.0940 6.9660...
    0.1530 0.7720 4.0250 2.4060 6.7490 7.5070 1.9290 0.0950 5.9870...
    6.3270 9.0560 2.7580 0.9780 2.3600 0.1500 1.9740 0.0740];
vowel_freqs = freqs(ismember(letters, vowels));
cons_freqs = freqs(ismember(letters, consonants));

word_length = max(round(a.WordLengthStd*randn + a.WordLength), 1);

w = [];
if word_length > 1
    for i = 1:word_length
        if rand < a.VowelsProp
            w = [w slctrnd(vowels, vowel_freqs)];
        else
            w = [w slctrnd(consonants, cons_freqs)];
        end
    end
else
    w = slctrnd(vowels);
end


function[r] = slctrnd(list, props)
if ~exist('props', 'var')
    props = ones(size(list))/length(list);
end

x = sample_from_dist(props);
r = list(x);


function[a] = parse_args(varargin)
assert((rem(length(varargin),2) == 0),'Arguments must be given in Property-Value pairs.');

a = get_defaults;
for i = 1:(length(varargin)/2)
    nextField = varargin{(2*(i-1) + 1)};
    assert(isfield(a, nextField), 'Unknown Property: ''%s''', nextField);    
    a.(nextField) = varargin{(2*(i-1) + 2)};
end

fnames = fieldnames(a);
for i = 1:length(fnames)
    assert(length(a.(fnames{i})) == 1, '''%s'' must be scalar.', fnames{i});
    assert(a.(fnames{i}) > 0, '''%s'' must be positive.', fnames{i});    
end

function[da] = get_defaults()
da.Paragraphs = 3;
da.Sentences = 4;
da.SentencesStd = 1;
da.Words = 8;
da.WordsStd = 2;
da.WordLength = 6;
da.WordLengthStd = 2;
da.VowelsProp = 0.5;
da.PunctuationProp = 0.05;



function[y,bins] = sample_from_dist(ps)

ps = ps./sum(ps);
vals = 1:length(ps);

%construct bins, normalize
edges = [0 cumsum(ps)];
edges(end) = 1 + eps; %make the last bin slightly larger, since
                      %histc uses the "<" operator to compare
                      %values to upper edges of each bin.

%bin the random draw
[~,bins] = histc(rand,edges);
y = vals(bins);



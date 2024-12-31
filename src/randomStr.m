function randString = randomStr(sLength, repetition, repNumber, fullRange)
%RANDOMSTR Generate a random string of length "len"
arguments(Input)
    sLength double
    repetition logical =false
    repNumber double = 256
    fullRange logical =false
end
    s = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

    %find number of random characters to choose from
    numRands = length(s);

    if (repetition)
        randString = '';
        for i=1:1:ceil(sLength/repNumber)
            index = randi([1, numRands]);
            if (fullRange)
                randString = append(randString, char(ones(1,repNumber)*randi([0, 255])));
            else
                randString = append(randString, s(ones(1,repNumber)*index));
            end
            
        end
    else
        %generate random string
        randString = s( ceil(rand(1,sLength)*numRands) );
    end
end

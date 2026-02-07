rng(42);             
P = [0.9   0.1   0.0;
     0.0   0.875 0.125;
     0.4   0.0   0.6];

n = 10000;
state = 1;            
countG = 0;

for t = 1:n
    u = rand;
    if state == 1      
        if u < P(1,1), state = 1; else, state = 2; end
    elseif state == 2  
        if u < P(2,2), state = 2; else, state = 3; end
    else              
        if u < P(3,1), state = 1; else, state = 3; end
    end

    if state == 1
        countG = countG + 1;
    end
end

fracG = countG / n
theory = 20/41
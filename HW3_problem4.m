rng(42);

P = [1/2 1/2 0   0   0   0;
     0   1/2 1/2 0   0   0;
     1/3 0   1/3 1/3 0   0;
     0   0   0   1/2 1/2 0;
     0   0   0   0   0   1;
     0   0   0   0   1   0];

Pc = cumsum(P,2);

Ntrials = 10000;
count = 0;

for rep = 1:Ntrials
    x = 1;                   
    for t = 1:5               
        u = rand;
        if u <= Pc(x,1)
            x = 1;
        elseif u <= Pc(x,2)
            x = 2;
        elseif u <= Pc(x,3)
            x = 3;
        elseif u <= Pc(x,4)
            x = 4;
        elseif u <= Pc(x,5)
            x = 5;
        else
            x = 6;
        end
    end
    if x == 4
        count = count + 1;
    end
end

frac = count / Ntrials
theory = 19/108
diff = frac - theory
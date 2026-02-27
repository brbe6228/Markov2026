clear; clc;


n = 5;          
p_fail = 0.1;   
p_work = 0.9;


P = zeros(n+1);     


P(1,6) = 1;         


for k = 1:n
    for j = 0:k
        P(k+1, j+1) = nchoosek(k,j)*(p_work^j)*(p_fail^(k-j));
    end
end

disp('Transition Matrix P:');
disp(P);




Q = P(2:end, 2:end);     
I = eye(n);
ones_vec = ones(n,1);


e = (I - Q) \ ones_vec;

fprintf('\nExpected time to hit 0 starting from 5: %.4f weeks\n', e(5));


A = [P' - eye(n+1); ones(1,n+1)];
b = [zeros(n+1,1); 1];

pi = A \ b;

disp('Stationary distribution:');
disp(pi');

fprintf('\nLong-run probability exactly 1 machine works: %.4f\n', pi(2));
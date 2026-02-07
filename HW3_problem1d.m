a  = sqrt(3) - 1;                   
c  = exp(-a) / (3 * a^2 * (1 - a));  

x = linspace(0, 15, 2000);

f = (1/3) .* x .* (1 + x) .* exp(-x);
g = (a^2) .* x .* exp(-a .* x);
env = c .* g;

figure;
plot(x, f, 'LineWidth', 1.5); hold on;
plot(x, env, 'LineWidth', 1.5);
grid on;
xlabel('x');
ylabel('density');
legend('f(x)', 'c(a^*) g_{a^*}(x)', 'Location', 'best');
title('Accept-Reject Target Density');
ylim([0, 1.05*max(env)]);
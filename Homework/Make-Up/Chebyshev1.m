%% Chebyshev Type I
clear 
close all
clc

N = 4;
Wp = 2*pi*20e3; 
Rp = 5;
[num, den] = cheby1(N, Rp, Wp, 'low', 's');
[z, p, k] = cheby1(N, Rp, Wp, 'low', 's');
tf(num, den)
z
p
k

N = 4;                          
Wp = 2*pi*20e3;                 % cutoff frequency (rad/s)
alpha_p_values = 0.1:0.1:5;     % Range of passband ripple from 0.1dB to 5dB with step 0.1

Qp_values = zeros(size(alpha_p_values));

for i = 1:length(alpha_p_values)

    Rp = alpha_p_values(i);
    
    [z, p, k] = cheby1(N, Rp, Wp, 'low', 's');
    
    % Calculate the Q factor for each pole
    Q_values = abs(p) ./ (2 * abs(real(p)));
    
    % Find the dominant pole
    Qp_values(i) = max(Q_values);
end

% Plot Qp as a function of alpha_p
figure;
plot(alpha_p_values, Qp_values, 'ob');
xlabel('Passband Ripple (\alpha_p in dB)');
ylabel('Dominant Pole Q(Q_p)');
title(['4th-Order Chebyshev Filter','Dominant Pole Q-factor vs Passband Ripple']);
grid on;
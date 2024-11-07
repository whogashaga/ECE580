clear; close all; clc;

% Define filter specifications
N = 4;                          % Filter order (4th order)
Wp = 1;                         % Normalized cutoff frequency (1 rad/s)
alpha_p_values = 0.1:0.1:5;     % Range of passband ripple in dB

% Initialize array to store Qp values
Qp_values = zeros(size(alpha_p_values));

for i = 1:length(alpha_p_values)
    % Define passband ripple for this iteration
    Rp = alpha_p_values(i);
    
    % Design the Chebyshev Type I filter and get poles
    [z, p, k] = cheby1(N, Rp, Wp, 'low', 's');
    
    % Calculate the quality factor Q for each pole
    Q_values = abs(p) ./ (2 * abs(real(p)));
    
    % Find the dominant pole (pole with highest Q)
    Qp_values(i) = max(Q_values);
end

% Plot Qp as a function of alpha_p
figure;
plot(alpha_p_values, Qp_values, 'b-', 'LineWidth', 1.5);
xlabel('Passband Ripple (\alpha_p in dB)');
ylabel('Dominant Pole Quality Factor (Q_p)');
title('Dominant Pole Q-factor vs Passband Ripple for 4th-Order Chebyshev Filter');
grid on;

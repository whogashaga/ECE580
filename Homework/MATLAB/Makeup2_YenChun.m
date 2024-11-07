clear; close all; clc;

% Define filter specifications
N = 4;                          % Filter order (4th order)
Wp = 1;                         % Normalized cutoff frequency (1 rad/s)
alpha_p_values = 0.1:0.1:10;    % Range of passband ripple in dB for testing

% Define Q threshold conditions
Q_thresholds = [5 3 1];
max_alpha_p = zeros(size(Q_thresholds));  % To store results for each Q threshold

for q_idx = 1:length(Q_thresholds)
    Q_limit = Q_thresholds(q_idx);
    
    for i = 1:length(alpha_p_values)
        % Define passband ripple for this iteration
        Rp = alpha_p_values(i);
        
        % Design the Chebyshev Type I filter and get poles
        [z, p, k] = cheby1(N, Rp, Wp, 'low', 's');
        
        % Calculate the quality factor Q for each pole
        Q_values = abs(p) ./ (2 * abs(real(p))); 
        
        % Find the dominant pole's Q-factor (highest Q)
        Qp = max(Q_values);
        
        % Check if the Qp meets the condition
        if Qp >= Q_limit
            max_alpha_p(q_idx) = last_valid_alpha_p;  % Store the last valid alpha_p
            break;
        else
            last_valid_alpha_p = Rp;  % Update last valid alpha_p if condition is still met
        end 
    end
end

% Display results
disp('Maximum passband ripple (alpha_p) for each Qp condition:');
for j = 1:length(Q_thresholds)
    fprintf('When Qp < %d: alpha_p = %.1f dB\n', Q_thresholds(j), max_alpha_p(j));
end

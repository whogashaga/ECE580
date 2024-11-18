%% Chebyshev Type I
clear 
close all
clc

% Specifications
Wp = 2500;         % Passband edge (rad/sec)
Ws = 12500;        % Stopband edge (rad/sec)
Rp = 0.5;          % Passband ripple (dB)
Rs = 30;           % Stopband attenuation (dB)

% Determine filter order and cutoff frequency
[n, Wn] = cheb1ord(Wp, Ws, Rp, Rs, 's')

% Get the transfer function coefficients
[b, a] = cheby1(n, Rp, Wn, 's')

% Display the transfer function
H = tf(b, a)

% (Optional) Plot the frequency response
freqs(b, a); % Analog frequency response
title('Frequency Response of Chebyshev Type I Filter');

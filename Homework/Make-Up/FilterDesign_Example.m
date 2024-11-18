% % Example
close all
clc
clear
% %% Choose filter type. Find order and cutoff frequency
Wp = 2*pi*20e3; Ws = 2*pi*40e3;
Rp = 0.2; Rs = 60;

% Wp = 2*pi*20e3; Ws = 2*pi*50e3;
% Wp = 1; Ws = 2.5;

% Rp = 0.3; Rs = 22;
% [N, Wn] = cheb1ord(Wp, Ws, Rp, Rs, 's')
[N, Wn] = cheb1ord(Wp, Ws, 0.5, 30, 's')

% N=3
%% Find numerator and denominator of filter transfer funcion
[num, den] = cheby1(N, Rp, Wn, 's');
tf(num, den)

%% To plot magnitude and phase
[H, w] = freqs(num, den);
semilogx(w, 20*log10(abs(H)));
xline(Wp);
xline(Ws);
grid on

figure(2)
% semilogx(w, 180/pi*phase(H));
semilogx(w, 180/pi*unwrap(angle(H)));
grid on

%% To plot step and group delay response
T = tf(num, den);
figure(3)
step(T)
grid on

% figure(4)
% % pd = -phase(H)./w;
% % gd = -diff(phase(H))./diff(w);
% gd = -diff(unwrap(angle(H)))./diff(w);
% % plot(w(1:length(w)), pd);
% % hold on
% plot(w(1:length(w)-1), gd);
% grid on

% 
%% Poles and zeros
[z, p, k] = cheby1(N, Rp, Wp, 'low', 's');
figure('Position',[400 600 400 400]);
figure(5)
plot(z,'o');
hold on
plot(p,'*');
grid on

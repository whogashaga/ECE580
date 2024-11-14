%% Butterworth Filter  
clear 
close all
clc
N = 5;
fs = 2*pi*100e3
Wn = 2*pi*20e3/fs;
[num, den] = butter(N, Wn);
[z, p, k] = butter(N, Wn);
freqz(num, den,[],fs)

figure(2)
T = tf(num, den, 1/fs)
pzmap(T);


%% Chebyshev Type I
clear 
close all
clc
N = 5;
fs = 2*pi*100e3
Wp = 2*pi*20e3/fs;
Rp = 5;
[num, den] = cheby1(N, Rp, Wp);
[z, p, k] = cheby1(N, Rp, Wp);
freqz(num, den,[],fs)

figure(2)
T = tf(num, den, 1/fs)
pzmap(T);


%% Chebyshev Type II 
clear 
close all
clc
N = 5;
fs = 2*pi*100e3
Ws = 2*pi*20e3/fs;
Rs = 40;
[num, den] = cheby2(N, Rs, Ws);
[z, p, k] = cheby2(N, Rs, Ws);
freqz(num, den,[],fs)

figure(2)
T = tf(num, den, 1/fs)
pzmap(T);


%% Elliptic
clear 
close all
clc
N = 5;
fs = 2*pi*100e3
Wp = 2*pi*20e3/fs;
Rp = 5;
Rs = 40;
[num, den] = ellip(N, Rp, Rs, Wp);
[z, p, k] = ellip(N, Rp, Rs, Wp);
freqz(num, den,[],fs)

figure(2)
T = tf(num, den, 1/fs)
pzmap(T);


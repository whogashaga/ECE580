%% Butterworth Filter  
clear 
close all
clc
N = 5;
Wn = 2*pi*20e3;
[num, den] = butter(N, Wn, 'low', 's');
[z, p, k] = butter(N, Wn, 'low', 's');


%% Chebyshev Type I
clear 
close all
clc
N = 5;
Wp = 2*pi*20e3;
Rp = 5;
[num, den] = cheby1(N, Rp, Wp, 'low', 's');
[z, p, k] = cheby1(N, Rp, Wp, 'low', 's');
tf(num, den)
z
p
k


%% Chebyshev Type II 
clear 
close all
clc
N = 5;
Ws = 2*pi*20e3;
Rs = 40;
[num, den] = cheby2(N, Rs, Ws, 'low', 's');
[z, p, k] = cheby2(N, Rs, Ws, 'low', 's');


%% Elliptic
clear 
close all
clc
N = 5;
Wp = 2*pi*20e3;
Rp = 5;
Rs = 40;
[num, den] = ellip(N, Rp, Rs, Wp, 'low', 's');
[z, p, k] = ellip(N, Rp, Rs, Wp, 'low', 's');

%% Bessel
clear 
close all
clc
N = 5;
Wn = 2*pi*20e3;
[num, den] = besself(N, Wn);
[z, p, k] = besself(N, Wn);

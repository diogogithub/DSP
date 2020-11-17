%% Inicialização do ambiente
clear ; close all; clc

%% Exercício 5
file_id = fopen("INS_10k.txt", "r");
A = fscanf(file_id, "%f %f %f %f %f %f %f", [7 Inf]);
A=A';

X  = A(:,1); % ang_rate ( angles/sec )
Y  = A(:,2);
Z  = A(:,3);
DX = A(:,4);
DY = A(:,5);
DZ = A(:,6);
t  = A(:,7);

fclose(file_id);

L = length(X); % Length of signal
total_time = (t(L)-t(1))/1000; % Time the sampling took in seconds
T = 0.02;  % Sampling period in seconds
SF = 1/T;  % Sampling frequency (cycles per sec)

tv = 0:1/SF:total_time; % secs (duh.)
F = SF*(1:(L))/L; % cycles per sec (Hertz)

% -- Normalizations -- %
F_rad = (2*pi) .* F ./ SF; % rads per sample
X_rad = X .* (pi/180); % ( radians / sec)
X_hertz = X_rad .* (1/(2*pi));

DFT_0_2pi = fft(X_rad, L); % entre 0 e 2pi
DFT_0_pi = DFT_0_2pi(1 : (L)/2);

%1)
figure(1)
subplot(2,2,1)
plot(tv,X) % X(t)
title("X(t)"); ylabel("Amplitude (angles)"); xlabel("Time (s)"); 
subplot(2,2,2)
plot(F_rad, abs(DFT_0_2pi)); % dft in 0:2pi
title("FFT of X in [0:2\pi]"); ylabel("Magnitude"); xlabel("\omega/\pi");
subplot(2,2,3)
plot(F_rad(1 : (L)/2), abs(DFT_0_pi)); %dft in 0:pi
title("FFT of X in [0:\pi]"); ylabel("Magnitude"); xlabel("\omega/\pi");
subplot(2,2,4)
plot(F,X_hertz); % X(f)
title("X in function of the frequency (Hz)"); ylabel("Amplitude (Hertz)"); xlabel("Frequency (Hertz)");

%2)
Y_rad = Y .* (pi/180);
Y_hertz = Y_rad .* (1/(2*pi));
Z_rad = Z .* (pi/180);
Z_hertz = Z_rad .* (1/(2*pi));

figure(2)
subplot(2,3,1)
plot(F,X_hertz); % X(f)
title("X in function of the frequency (Hz)"); ylabel("Amplitude (Hertz)"); xlabel("Frequency (Hertz)");
subplot(2,3,2)
plot(F,Y_hertz); % X(f)
title("Y in function of the frequency (Hz)"); ylabel("Amplitude (Hertz)"); xlabel("Frequency (Hertz)");
subplot(2,3,3)
plot(F,Z_hertz); % X(f)
title("Z in function of the frequency (Hz)"); ylabel("Amplitude (Hertz)"); xlabel("Frequency (Hertz)");

subplot(2,3,4)
plot(F,abs(fft(X_hertz)));
title("DFT of X in function of the frequency (Hz)"); ylabel("Magnitude"); xlabel("Frequency (Hertz)");
subplot(2,3,5)
plot(F,abs(fft(Y_hertz)));
title("DFT of Y in function of the frequency (Hz)"); ylabel("Magnitude"); xlabel("Frequency (Hertz)");
subplot(2,3,6)
plot(F,abs(fft(Z_hertz)));
title("DFT of Z in function of the frequency (Hz)"); ylabel("Magnitude"); xlabel("Frequency (Hertz)");

%3)
DX_rad = DX .* (pi/180);
DX_hertz = DX_rad .* (1/(2*pi));
DX_hertz = DX_hertz(1:601);
DY_rad = DY .* (pi/180);
DY_hertz = DY_rad .* (1/(2*pi));
DY_hertz = DY_hertz(1:601);
DZ_rad = DZ .* (pi/180);
DZ_hertz = DZ_rad .* (1/(2*pi));
DZ_hertz = DZ_hertz(1:601);
F3 = F(1:601);

figure(3)
subplot(2,3,1)
plot(F3,DX_hertz); % X(f)
title("X' in function of the frequency (Hz)"); ylabel("Amplitude (Hertz)"); xlabel("Frequency (Hertz)");
subplot(2,3,2)
plot(F3,DY_hertz); % X(f)
title("Y' in function of the frequency (Hz)"); ylabel("Amplitude (Hertz)"); xlabel("Frequency (Hertz)");
subplot(2,3,3)
plot(F3,DZ_hertz); % X(f)
title("Z' in function of the frequency (Hz)"); ylabel("Amplitude (Hertz)"); xlabel("Frequency (Hertz)");

subplot(2,3,4)
plot(F3,abs(fft(DX_hertz)));
title("DFT of X in function of the frequency (Hz)"); ylabel("Magnitude"); xlabel("Frequency (Hertz)");
subplot(2,3,5)
plot(F3,abs(fft(DY_hertz)));
title("DFT of Y in function of the frequency (Hz)"); ylabel("Magnitude"); xlabel("Frequency (Hertz)");
subplot(2,3,6)
plot(F3,abs(fft(DZ_hertz)));
title("DFT of Z in function of the frequency (Hz)"); ylabel("Magnitude"); xlabel("Frequency (Hertz)");

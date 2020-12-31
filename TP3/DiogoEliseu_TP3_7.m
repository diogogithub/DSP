%% Inicialização do ambiente
clear; close all; clc

%% Exercício 7
[y, Fs] = audioread("Canto1.mp3");
s = y(:,1);
%Ts = 1/Fs;

% S: short-time Fourier transform of the input signal
% F: vector of cyclical frequencies
% T: vector of time instants
% P: power spectral density (PSD)
                    % signal, window, noverlap, nfft, fs
[S, F, T, P] = spectrogram(s, 128, 96, 128, Fs);

figure(1)
% Signal
subplot(2,3,1)
surf(T, F, 10*log10(P), 'edgecolor', 'none')
axis tight, view(0,90)
title("Original Signal (X)"); ylabel("Frequency (Hz)"); xlabel("Time (s)");

% Noise
subplot(2,3,2)
%T_noise = T(1377:4134);
s_noise = s((Fs * (1 - 1)) + 1 : Fs * (3 - 1)); % [1-3]
[S_noise, F_noise, T_noise, P_noise] = spectrogram(s_noise, 128, 96, 128, Fs);
surf(T_noise, F_noise, 10*log10(P_noise), 'edgecolor', 'none')
axis tight, view(0,90)
title("Background Noise (Xn) in 1-3s"); ylabel("Frequency (Hz)"); xlabel("Time (s)");

% Song
subplot(2,3,3)
s_chirp = s((Fs * (4 - 1)) + 1 : Fs * (6 - 1)); % [4-6]
[S_chirp, F_chirp, T_chirp, P_chirp] = spectrogram(s_chirp, 128, 96, 128, Fs);
surf(T_chirp, F_chirp, 10*log10(P_chirp), 'edgecolor', 'none')
axis tight, view(0,90)
title("Chirp (Xs) in 4-6s"); ylabel("Frequency (Hz)"); xlabel("Time (s)");

% DFT signal
subplot(2,3,4)
L_s = length(s);
f_s_2pi = linspace(0, Fs, L_s)/1000; % to kHz
f_s_half = f_s_2pi(1:(length(f_s_2pi)/2));
DFT_s = fft(s);
DFT_s_half = DFT_s(1 : (L_s/2));
plot(f_s_half, abs(DFT_s_half));
title("X in function of the frequency (kHz)"); ylabel("Amplitude (Hz)"); xlabel("Frequency (kHz)");

% DFT noise
subplot(2,3,5)
L_s_noise = length(s_noise);
f_s_noise_2pi = linspace(0, Fs, L_s_noise)/1000; % to kHz
f_s_noise_half = f_s_noise_2pi(1:(length(f_s_noise_2pi)/2));
DFT_s = fft(s_noise);
DFT_s_noise_half = DFT_s(1 : (L_s_noise/2));
plot(f_s_noise_half, abs(DFT_s_noise_half));
title("Xn in function of the frequency (kHz)"); ylabel("Amplitude (Hz)"); xlabel("Frequency (kHz)");

% DFT chirp
subplot(2,3,6)
L_s_chirp = length(s_chirp);
f_s_chirp_2pi = linspace(0, Fs, L_s_chirp)/1000; % to kHz
f_s_chirp_half = f_s_chirp_2pi(1:(length(f_s_chirp_2pi)/2));
DFT_s = fft(s_chirp);
DFT_s_chirp_half = DFT_s(1 : (L_s_chirp/2));
plot(f_s_chirp_half, abs(DFT_s_chirp_half));
title("Xs in function of the frequency (kHz)"); ylabel("Amplitude (Hz)"); xlabel("Frequency (kHz)");
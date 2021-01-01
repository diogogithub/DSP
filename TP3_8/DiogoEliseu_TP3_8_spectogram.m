%% Inicialização do ambiente
clear; close all; clc

%% Exercício 8 part 2: electric boogaloo
%% First bird - Common Chiffchaff

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
subplot(2,2,1)
surf(T, F, 10*log10(P), 'edgecolor', 'none')
axis tight, view(0,90)
title("Original Signal (Common Chiffchaff)"); ylabel("Frequency (Hz)"); xlabel("Time (s)");

% Song
subplot(2,2,2)
s_chirp = s((Fs * (4 - 1)) + 1 : Fs * (6 - 1)); % [4-6]
[S_chirp, F_chirp, T_chirp, P_chirp] = spectrogram(s_chirp, 128, 96, 128, Fs);
surf(T_chirp, F_chirp, 10*log10(P_chirp), 'edgecolor', 'none')
axis tight, view(0,90)
title("Chirp [4s-6s]"); ylabel("Frequency (Hz)"); xlabel("Time (s)");

% DFT signal
subplot(2,2,3)
L_s = length(s);
f_s_2pi = linspace(0, Fs, L_s)/1000; % to kHz
f_s_half = f_s_2pi(1:(length(f_s_2pi)/2));
DFT_s = fft(s);
DFT_s_half = DFT_s(1 : (L_s/2));
plot(f_s_half, abs(DFT_s_half));
title("X in function of the frequency (kHz)"); ylabel("Amplitude"); xlabel("Frequency (kHz)");

% DFT chirp
subplot(2,2,4)
L_s_chirp = length(s_chirp);
f_s_chirp_2pi = linspace(0, Fs, L_s_chirp)/1000; % to kHz
f_s_chirp_half = f_s_chirp_2pi(1:(length(f_s_chirp_2pi)/2));
DFT_s = fft(s_chirp);
DFT_s_chirp_half = DFT_s(1 : (L_s_chirp/2));
plot(f_s_chirp_half, abs(DFT_s_chirp_half));
title("Xs in function of the frequency (kHz)"); ylabel("Amplitude"); xlabel("Frequency (kHz)");

%% Second bird - Black-winged Stilt

[y, Fs] = audioread("Canto2.mp3");
s = y(:,1);
%Ts = 1/Fs;

% S: short-time Fourier transform of the input signal
% F: vector of cyclical frequencies
% T: vector of time instants
% P: power spectral density (PSD)
                    % signal, window, noverlap, nfft, fs
[S, F, T, P] = spectrogram(s, 128, 96, 128, Fs);

figure(2)
% Signal
subplot(2,2,1)
surf(T, F, 10*log10(P), 'edgecolor', 'none')
axis tight, view(0,90)
title("Original Signal (Black-winged Stilt)"); ylabel("Frequency (Hz)"); xlabel("Time (s)");

% Song
subplot(2,2,2)
s_chirp = s((Fs * (17 - 1)) + 1 : Fs * (19 - 1)); % [17-19]
[S_chirp, F_chirp, T_chirp, P_chirp] = spectrogram(s_chirp, 128, 96, 128, Fs);
surf(T_chirp, F_chirp, 10*log10(P_chirp), 'edgecolor', 'none')
axis tight, view(0,90)
title("Chirp [17s-19s]"); ylabel("Frequency (Hz)"); xlabel("Time (s)");

% DFT signal
subplot(2,2,3)
L_s = length(s);
f_s_2pi = linspace(0, Fs, L_s)/1000; % to kHz
f_s_half = f_s_2pi(1:(length(f_s_2pi)/2));
DFT_s = fft(s);
DFT_s_half = DFT_s(1 : (L_s/2));
plot(f_s_half, abs(DFT_s_half));
title("X in function of the frequency (kHz)"); ylabel("Amplitude"); xlabel("Frequency (kHz)");

% DFT chirp
subplot(2,2,4)
L_s_chirp = length(s_chirp);
f_s_chirp_2pi = linspace(0, Fs, L_s_chirp)/1000; % to kHz
f_s_chirp_half = f_s_chirp_2pi(1:(length(f_s_chirp_2pi)/2));
DFT_s = fft(s_chirp);
DFT_s_chirp_half = DFT_s(1 : (L_s_chirp/2));
plot(f_s_chirp_half, abs(DFT_s_chirp_half));
title("Xs in function of the frequency (kHz)"); ylabel("Amplitude"); xlabel("Frequency (kHz)");

%% Third bird - Grey Heron

[y, Fs] = audioread("Canto3.mp3");
s = y(:,1);
%Ts = 1/Fs;

% S: short-time Fourier transform of the input signal
% F: vector of cyclical frequencies
% T: vector of time instants
% P: power spectral density (PSD)
                    % signal, window, noverlap, nfft, fs
[S, F, T, P] = spectrogram(s, 128, 96, 128, Fs);

figure(3)
% Signal
subplot(2,2,1)
surf(T, F, 10*log10(P), 'edgecolor', 'none')
axis tight, view(0,90)
title("Original Signal (Grey Heron)"); ylabel("Frequency (Hz)"); xlabel("Time (s)");

% Song
subplot(2,2,2)
s_chirp = s((Fs * (2 - 1)) + 1 : Fs * (4 - 1)); % [2-4]
[S_chirp, F_chirp, T_chirp, P_chirp] = spectrogram(s_chirp, 128, 96, 128, Fs);
surf(T_chirp, F_chirp, 10*log10(P_chirp), 'edgecolor', 'none')
axis tight, view(0,90)
title("Chirp [2s-4s]"); ylabel("Frequency (Hz)"); xlabel("Time (s)");

% DFT signal
subplot(2,2,3)
L_s = length(s);
f_s_2pi = linspace(0, Fs, L_s)/1000; % to kHz
f_s_half = f_s_2pi(1:(length(f_s_2pi)/2));
DFT_s = fft(s);
DFT_s_half = DFT_s(1 : (L_s/2));
plot(f_s_half, abs(DFT_s_half));
title("X in function of the frequency (kHz)"); ylim([0 300]);ylabel("Amplitude"); xlabel("Frequency (kHz)");

% DFT chirp
subplot(2,2,4)
L_s_chirp = length(s_chirp);
f_s_chirp_2pi = linspace(0, Fs, L_s_chirp)/1000; % to kHz
f_s_chirp_half = f_s_chirp_2pi(1:(length(f_s_chirp_2pi)/2));
DFT_s = fft(s_chirp);
DFT_s_chirp_half = DFT_s(1 : (L_s_chirp/2));
plot(f_s_chirp_half, abs(DFT_s_chirp_half));
title("Xs in function of the frequency (kHz)");ylim([0 40]); ylabel("Amplitude"); xlabel("Frequency (kHz)");


%% clean environment
clear; close all; clc

%% read input
[signal, fs] = audioread("Canto1.mp3");

%% Compute the FFT
signal_length = length(signal);
fhat = fft(signal, signal_length);
PSD = fhat.*conj(fhat)/signal_length; % Power spectrum density
%[S, freq, T, PSDlel] = spectrogram(signal, 128, 96, 128, Fs);
% signal, window, noverlap, nfft, fs
freq_vector = linspace(1, fs, signal_length);
L = 1:floor(signal_length/2);

cutoff_indices = abs(PSD)>0.002;
PSD_clean = PSD.*cutoff_indices;
fhat_filtered = cutoff_indices.*fhat;
signal_filtered = ifft(fhat_filtered);

figure(1)
plot(PSD)

figure(2)
plot(PSD_clean)

figure(3)
plot(signal)

figure(4)
plot(signal_filtered)

%% output
audiowrite('restored.flac', signal_filtered, fs);
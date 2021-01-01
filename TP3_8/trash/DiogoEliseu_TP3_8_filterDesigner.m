%% Inicialização do ambiente
clear; close all; clc

%% Exercício 8
% Input
[y, Fs] = audioread("Canto1.mp3"); % Signal and Sampling Frequency
signal = y(:,1);
Fn = Fs/2; % Nyquist Frequency (Hz)
%Ts = 1/Fs;
L = length(signal); % Signal Length

% Find the noise
FTsignal = fft(signal)/L;           % Fourier Transform
Fv = linspace(0, 1, fix(L/2)+1)*Fn; % Frequency Vector
Iv = 1:numel(Fv);                   % Index Vector
figure(1)
% x is Hz, y is amplitude
plot(Fv, abs(FTsignal(Iv))*2)
grid

% Filter
signal_filtered = filter(nd_designed_sexy,signal);
figure(2)
subplot(2,1,1)
plot(signal)
subplot(2,1,2)
plot(signal_filtered);

% output
audiowrite('restored.flac', signal_filtered, Fs);
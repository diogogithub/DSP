%% Inicialização do ambiente
clear; close all; clc

%% >Exercício 8<

%% Input
[y, Fs] = audioread("Canto1.mp3"); % Signal and Sampling Frequency
signal = y(:,1);                   % Discard second channel
Fn = Fs/2;                         % Nyquist Frequency (Hz)
L = length(signal);                % Signal Length

%% Compute the DFT
dft = fft(signal)./L;
magnitude = 10.*log10(abs(dft).^2); % power is squared, thus 10
Fv = linspace(0, 1, L)*Fn;          % Frequency Vector

%% High-pass Filter
not_to_cutoff_indices = magnitude > -96;
dft_filtered = not_to_cutoff_indices.*dft;
magnitude_filtered = not_to_cutoff_indices.*magnitude;
signal_filtered = ifft(dft_filtered.*L);

%% Output
Fv_half = linspace(0, 1, fix(L/2)+1)*Fn;
y = abs(dft(1:(L/2+1)));
y_filtered = abs(dft_filtered(1:(L/2+1)));
figure(1)
subplot(2,3,1)
plot(Fv_half, y)
grid
xlabel("Frequência (Hz)"); ylabel("|H_{1}(f)|"); title("DFT do Sinal")
subplot(2,3,4)
plot(Fv_half, y_filtered)
grid
xlabel("Frequência (Hz)"); ylabel("|H_{1}(f)|"); title("DFT do Sinal Filtrado")
subplot(2,3,2)
plot(Fv_half, signal(1:(L/2+1)))
grid
xlabel("Frequência (Hz)"); ylabel("Amplitude"); title("Sinal")
subplot(2,3,5)
plot(Fv_half, y_filtered)
grid
xlabel("Frequência (Hz)"); ylabel("Amplitude"); title("Sinal Filtrado")
subplot(2,3,3)
%plot(Fv, magnitude);
plot(Fv_half, mag2db(y))
grid
xlabel("Frequência (Hz)"); ylabel("Ganho (dB)"); title("Ganho do Sinal")
subplot(2,3,6)
plot(Fv_half, mag2db(y_filtered))
grid
xlabel("Frequência (Hz)"); ylabel("Ganho (dB)"); title("Ganho do Sinal Filtrado")

%sound(signal_filtered, Fs);
%audiowrite('canto1_high_pass.flac', signal_filtered, Fs);
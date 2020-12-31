%% Inicialização do ambiente
clear; close all; clc

%% >Exercício 8<
%% Input
[y, Fs] = audioread("Canto1.mp3"); % Signal and Sampling Frequency
signal = y(:,1);                   % Discard second channel
Fn = Fs/2;                         % Nyquist Frequency (Hz)
L = length(signal);                % Signal Length

%% Find the noise
dft_signal = fft(signal)./L;          % Fourier Transform
Fv = linspace(0, 1, fix(L/2)+1)*Fn;   % Frequency Vector

%% Filter
%signal_filtered = filter(DiogoEliseu_TP3_8_butterworth_2nd_order_filter,signal);
signal_filtered = filter(DiogoEliseu_TP3_8_butterworth_filter,signal);

%% Filtered signal
dft_signal_filtered = fft(signal_filtered)/L; % Fourier Transform

%% Output
signal_power = abs(dft_signal(1:(L/2+1)));
figure(1)
subplot(2,3,1)
hold on
plot(Fv, signal_power)
grid
marks = [2850, 3020, 7000, 7150];
plot(2850, signal_power(2850), 'r*')
plot(3020, signal_power(3020), 'r*')
plot(7000, signal_power(7000), 'r*')
plot(7150, signal_power(7150), 'r*')
xlabel("Frequência (Hz)"); ylabel("|H_{1}(f)|"); title("DFT do Sinal")
hold off
subplot(2,3,4)
plot(Fv, abs(dft_signal_filtered(1:(L/2+1))))
grid
xlabel("Frequência (Hz)"); ylabel("|H_{1}(f)|"); title("DFT do Sinal Filtrado")
subplot(2,3,2)
plot(Fv, signal(1:(L/2+1)))
grid
xlabel("Frequência (Hz)"); ylabel("Amplitude"); title("Sinal")
subplot(2,3,5)
plot(Fv, signal_filtered(1:(L/2+1)))
grid
xlabel("Frequência (Hz)"); ylabel("Amplitude"); title("Sinal Filtrado")
subplot(2,3,3)
plot(Fv, mag2db(signal_power))
grid
xlabel("Frequência (Hz)"); ylabel("Ganho (dB)"); title("Ganho do Sinal")
subplot(2,3,6)
plot(Fv, mag2db(abs(dft_signal_filtered(1:(L/2+1)))))
grid
xlabel("Frequência (Hz)"); ylabel("Ganho (dB)"); title("Ganho do Sinal Filtrado")

%sound(signal_filtered, Fs);
%audiowrite('canto1_butterworth.flac', signal_filtered, Fs);
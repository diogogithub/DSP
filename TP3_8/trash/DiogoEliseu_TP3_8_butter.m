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

% Butterworth Low-Pass Order 7
%[num, den] = butter(7, fc, 'low'); %order, cutoff frequency, type
%[SOS,G] = tf2sos(num, den); % Convert To Second-Order-Section For Stability
%figure(1)
%freqz(SOS, 4096, Fs) % Check Filter Performance
%s_filtered = filtfilt(SOS, G, signal);

fcutlow = 3000;
fcuthigh = 3500;
Wp = [fcutlow fcuthigh]/Fn; % Passband Frequency (Normalised)
Ws = [fcutlow*0.95 fcuthigh/0.95]/Fn; % Stopband Frequency (Normalised)
Rp = 30; % Passband Ripple (dB)
Rs = 30; % Stopband Ripple (dB)
%[n,Wn] = buttord(Wp,Ws,Rp,Rs); % Filter Order
n=2;
Wn=3200/Fn;
[z,p,k] = butter(n, Wn, 'low'); % Filter Design
[sosbp,gbp] = zp2sos(z, p, k); % Convert To Second-Order-Section For Stability
%freqz(sosbp, 2^20, Fs) % Filter Bode Plot
signal_filtered = filtfilt(sosbp, gbp, signal); % Filter Signal
figure(2)
subplot(2,1,1)
plot(signal)
subplot(2,1,2)
plot(signal_filtered);



% output
audiowrite('restored.flac', signal_filtered, Fs);
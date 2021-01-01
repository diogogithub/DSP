%% Inicialização do ambiente
clear; close all; clc

%% Exercício 8
[y, Fs] = audioread("Canto1.mp3"); % Signal and Sampling Frequency
s = y(:,1);
L = length(s);

Fn = Fs/2;                                              % Nyquist Frequency
Wp = [150  5800]/Fn;                                    % Normalised Passband
Ws = [ 50  6100]/Fn;                                    % Normalised Stopband
Rp =  1;                                                % Passband Ripple (dB)
Rs = 30;                                                % Stopband Ripple (dB)
[n,Ws] = cheb2ord(Wp,Ws,Rp,Rs);                         % Chebyshev Type II Order
[b,a] = cheby2(n,Rs,Ws);                                % IIR Filter Coefficients
[SOS,G] = tf2sos(b,a);                                  % Convert To Second-Order-Section For Stability
figure(1)
freqz(SOS, 4096, Fs)                                    % Check Filter Performance

s_filtered = filtfilt(SOS, G, s);

fcuts = [680 690 710 720  1190 1205  1210 1220  6000  6100];    % Frequency Vector
mags =   [1 0 1 0 1 0];                                         % Magnitude (Defines Passbands & Stopbands)
devs = [0.05  0.01  0.05  0.01 0.05  0.01];                     % Allowable Deviations
[n,Wn,beta,ftype] = kaiserord(fcuts,mags,devs,Fs);
n = n + rem(n,2);
hh = fir1(n,Wn,ftype,kaiser(n+1,beta),'scale');
figure(2)
freqz(hh,1, 4096, Fs)                                           % Filter Bode Plot
filt_sig = filtfilt(hh, 1, s);                                  % Filter Signal
FTS = fft(s)/L;                                                 % FFT Of Original Signal
FTFS = fft(filt_sig)/L;                                         % FFT Of Filtered Signal
Fv = linspace(0, 1, fix(L/2)+1)*Fn;                             % FFT Frequency Vector
Iv = 1:length(Fv);                                              % Index Vector
[pks,Frs] = findpeaks(abs(FTS(Iv))*2, Fv, 'MinPeakHeight',0.1); % Find Pure Tone Frequencies
figure(3)
semilogy(Fv, (abs(FTS(Iv)))*2)
hold on
plot(Fv, (abs(FTFS(Iv)))*2)
hold off
grid
axis([0  2500    ylim])

% output
audiowrite('restored.flac', s_filtered, Fs);
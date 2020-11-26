%% Inicialização do ambiente
clear ; close all; clc

%% Exercício 2
sintetico_data = fopen('sintetico.csv');
sintetico = textscan(sintetico_data, '%f', 'Delimiter', ',');
sintetico = sintetico{1,1};
fclose(sintetico_data);
cello = importdata('cello.mat');
EEG = importdata('EEG.mat');
EEG = EEG';

% sinal sintetico
Ls = length(sintetico);
Ts = 0.125;
Fs = 1/Ts;
Fs_vector = (0:Ls-1)/Ls * Fs;

% sinal cello
Lc = length(cello.x);
Tc = cello.dt;
Fc = 1/Tc;
Fc_vector = (0:Lc-1)/Lc * Fc;

% sinal EEG
Le = length(EEG);
Fe = 100;
Fe_vector = (1:Le-1)/Le * Fe;

figure(1)

subplot(2,1,1)
plot(sintetico);
title('sinal sintetico');

subplot(2,1,2)
DFT_synth = fft(sintetico, Ls);
plot(Fs_vector, abs(DFT_synth))
xlabel('\omega/\pi'), ylabel('|X(\omega)|'), title('DFT sintetico em [0, \pi]')

figure(2)

subplot(2,1,1)
plot(cello.x);
title('sinal cello');

subplot(2,1,2)
DFT_cello = fft(cello.x, Lc);
plot(Fc_vector, abs(DFT_cello))
xlabel('\omega/\pi'), ylabel('|X(\omega)|'), title('DFT cello em [0, \pi]')

figure(3)

subplot(2,1,1)
plot(EEG);
title('sinal EEG');

subplot(2,1,2)
DFT_EEG = fft(EEG, Le-1);
plot(Fe_vector, abs(DFT_EEG))
xlabel('\omega/\pi'), ylabel('|X(\omega)|'), title('DFT EEG em [0, \pi]')


function f = X(N, inicio, fim)
f = (0:(1/N):(1 - 1/N))*(fim-inicio)+inicio;
end
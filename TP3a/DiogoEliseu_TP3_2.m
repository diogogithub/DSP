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
Fs_vector = linspace(0, 2*pi*Fs, Ls)/(pi*Fs);
Fs_vector_pi = Fs_vector(1:(length(Fs_vector)/2));

% sinal cello
Lc = length(cello.x);
Tc = cello.dt;
Fc = 1/Tc;
Fc_vector = linspace(0, 2*pi*Fc, Lc)/(pi*Fc);
Fc_vector_pi = Fc_vector(1:(length(Fc_vector)/2));

% sinal EEG
Le = length(EEG);
Fe = 100;
Fe_vector = linspace(0, 2*pi*Fe, Le)/(pi*Fe);
Fe_vector_pi = Fe_vector(1:(length(Fe_vector)/2));

figure(1)

subplot(2,1,1)
plot(sintetico);
xlabel('t'), ylabel('sintetico[t]'), title('sinal sintetico');

subplot(2,1,2)
DFT_synth = fft(sintetico, Ls);
DFT_synth_pi = DFT_synth(1 : (Ls)/2);
plot(Fs_vector_pi, abs(DFT_synth_pi))
xlabel('\omega/\pi'), ylabel('|X(\omega)|'), title('DFT sintetico em [0, \pi]')

figure(2)

subplot(2,1,1)
plot(cello.x);
xlabel('t'), ylabel('cello[t]'), title('sinal cello');

subplot(2,1,2)
DFT_cello = fft(cello.x, Lc);
DFT_cello_pi = DFT_cello(1 : (Lc)/2);
plot(Fc_vector_pi, abs(DFT_cello_pi))
xlabel('\omega/\pi'), ylabel('|X(\omega)|'), title('DFT cello em [0, \pi]')

figure(3)

subplot(2,1,1)
plot(EEG);
xlabel('t'), ylabel('eeg[t]'), title('sinal EEG');

subplot(2,1,2)
DFT_EEG = fft(EEG, Le);
DFT_EEG_pi = DFT_EEG(1 : (Le)/2);
plot(Fe_vector_pi, abs(DFT_EEG_pi))
xlabel('\omega/\pi'), ylabel('|X(\omega)|'), title('DFT EEG em [0, \pi]')


function f = X(N, inicio, fim)
f = (0:(1/N):(1 - 1/N))*(fim-inicio)+inicio;
end
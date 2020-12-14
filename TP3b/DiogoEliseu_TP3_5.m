%% Inicialização do ambiente
clear; close all; clc

%% Exercício 5
load("DiogoEliseu_TP3_5filt.mat");

figure(1)
plotinhos(passa_baixa_SOS, passa_baixa_G)
sgtitle('Low-pass')

figure(2)
plotinhos(passa_alta_SOS, passa_alta_G)
sgtitle('High-pass')

figure(3)
plotinhos(passa_banda_SOS, passa_banda_G)
sgtitle('Band-pass')

figure(4)
plotinhos(corta_banda_SOS, corta_banda_G)
sgtitle('Band-Cut')

function plotinhos(SOS, G)
[num, den] = sos2tf(SOS, G);
[z, p, ~] = tf2zp(num, den);
[h, w] = freqz(num, den);
w_pi = w/pi;
gain = 20.*log10(abs(h));

subplot(2,2,1)
% Módulo
plot(w_pi, gain);
ylabel("Gain (dB)"); xlabel("\omega/\pi"); title('Filter Gain');

subplot(2,2,2)
% Fase
%freqz(p,1);
plot(w_pi, unwrap(angle(h)));
ylabel("Phase (degrees)"); xlabel("Normalized Frequency (x\pi rad/sample)"); title('Phase');

subplot(2,2,3)
% Resposta Impulsional
impulseplot(tf(num, den));

subplot(2,2,4)
% Zeros e Polos
zplane(z, p);
title("Pole-Zero plot");
end
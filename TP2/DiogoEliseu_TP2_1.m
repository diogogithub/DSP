%% Inicialização do ambiente
clear ; close all; clc

%% Exercício 1

figure(1)
p = [1.8, 0.5, -0.3];
d = [1, 0.3, -0.2];
w = -4*pi:(8*pi/999):4*pi;
freqz(p, d, w)

figure(2)
p = [1];
d = [1, 0.5];
w = -4*pi:(8*pi/999):4*pi;
freqz(p, d, w)

figure(3)
p = [1 2 3 4 1 3];
w = -4*pi:(8*pi/999):4*pi;
%[cena, coisa] = freqz(p, 1, w);
%plot(unwrap(angle(cena)));
%figure(4)
freqz(p, 1, w);
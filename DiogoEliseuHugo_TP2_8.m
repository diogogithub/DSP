%% Inicialização do ambiente
clear ; close all; clc

% Definimos uma seed estatica para o gerador de números aleatórios de forma
% a podermos repetir os experimentos com resultados determinísticos
rng(42);

%% Exercício 8
N_len = 81;
N = 0:(N_len-1);

s = 2 * N .* (0.9.^N);
r = rand(1,N_len) - 0.5;
x = s + r;

xc = [0 x 0];
xe = [x 0 0];
xd = [0 0 x];

figure
hold on
plot(s)
plot(x)

xnovo = (xc + xe + xd) / 3;
y3 = xnovo(2:N_len+1);
plot(y3)

xc =  [0 0 x 0 0];
xe =  [x 0 0 0 0];
xd =  [0 0 0 0 x];
xee = [0 x 0 0 0];
xdd = [0 0 0 x 0];
xnovo = (xc + xe + xd + xee + xdd) / 5;
y5 = xnovo(4:N_len+3);
plot(y5)

hold off

legend("s","x","y3","y5");
errors = ['Ex: ' num2str(DiogoEliseuHugo_TP2_6(x, s)) ' Ey3: ' num2str(DiogoEliseuHugo_TP2_6(y3, s)) ' Ey5: ' num2str(DiogoEliseuHugo_TP2_6(y5, s))];
title(errors)
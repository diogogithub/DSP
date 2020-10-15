%% Inicialização do ambiente
clear ; close all; clc

% Definimos uma seed estatica para o gerador de números aleatórios de forma
% a podermos repetir os experimentos com resultados determinísticos
rng(42);

%% Exercício 7
N = 0:80;

s = 2 * N .* (0.9.^N);
r = rand(1,81) - 0.5;
x = s + r;

figure
hold on
plot(s);
plot(r);
plot(x);
hold off

legend('s', 'r', 'x')

title(['Erro de aproximação de x a s: ' num2str(DiogoEliseuHugo_TP2_6(s, x))])

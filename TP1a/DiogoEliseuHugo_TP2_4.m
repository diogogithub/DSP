%% Inicialização do ambiente
clear ; close all; clc

% Definimos uma seed estatica para o gerador de números aleatórios de forma
% a podermos repetir os experimentos com resultados determinísticos
rng(42);

%% Exercício 4
n = 1:81;
x1 = rand(1, 81) * (5 + 5) - 5;
x2 = randn(1, 81) * 2;
x3 = rand(1, 81) >= 0.2;

% Figura com os resultados
figure
% Plot de x1
subplot(3,1,1)
stem(n, x1)
title('x1')
% Plot de x2
subplot(3,1,2)
stem(n, x2)
title('x2')
% Plot de x3
subplot(3,1,3)
stem(n, x3)
title('x3')

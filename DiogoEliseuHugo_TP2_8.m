%% Inicialização do ambiente
clear ; close all; clc

% Definimos uma seed estatica para o gerador de números aleatórios de forma
% a podermos repetir os experimentos com resultados determinísticos
rng(42);

%% Exercício 8
N = 0:80;

s = 2 * N .* (0.9.^N);
r = rand(1,81) - 0.5;
x = s + r;

figure
hold on
plot(s)
plot(x)
y3 = my_filter(1, 3, s);
plot(y3)
y5 = my_filter(1, 5, x);
plot(y5)
hold off

fprintf("erro de x aproximado a s: %f\n", erro(x, s));
fprintf("erro de y3 aproximado a s: %f\n", erro(y3, s));
fprintf("erro de y5 aproximado a s: %f\n", erro(y5, s));

function y = my_filter(A, SIZE, X)
   y = conv(X / (SIZE.^2), SIZE, 'valid');
end

function er = erro(X1,X2)
    er = norma(X2-X1,2) / norma(X1,2);
end

function s = norma(X, P)
    s = sum(abs(X).^P).^(1/P);
end
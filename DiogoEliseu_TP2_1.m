%% Inicialização do ambiente
clear ; close all; clc

%% Exercício 1
n = -20:20; % janela

% Impulso def
impulso = zeros(1,41);
impulso(21) = 1;

% Degrau def
degrau = (n >= 0);

% Figura com os resultados
figure
% Plot da sequência X
subplot(2,2,1:2)
x = fun_x(n);
stem(n, x)
% Plot do impulso
subplot(2,2,3)
stem(n, impulso)
% Plot do degrau
subplot(2,2,4)
stem(n, degrau)

% Definição da sequência X
function p = fun_x(N)
    A=1.8;
    f=0.05;
    phi=0.5*pi;
    p=A*cos(2*pi*f*N+phi);
end
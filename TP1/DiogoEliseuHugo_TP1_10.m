%% Inicialização do ambiente
clear ; close all; clc

%% Exercício 10
n = 0:250; % janela

w1 = 0.1*pi;
w2 = 0.2*pi;
w3 = 0.3*pi;

x1 = 2*cos(w1*n);
x2 = 2*cos(w2*n);
x3 = 2*cos(w3*n);

% Figura com os resultados de x1
figure
hold on
% Plot de x1
subplot(2,1,1)
stem(n, x1)
title('x1')
% Plot do output para x1
subplot(2,1,2)
stem(n, fun_y(x1))
title('output para x1')
hold off

% Figura com os resultados de x2
figure
hold on
% Plot de x2
subplot(2,1,1)
stem(n, x2)
title('x2')
% Plot do output para x1
subplot(2,1,2)
stem(n, fun_y(x2))
title('output para x2')
hold off

% Figura com os resultados de x3
figure
hold on
% Plot de x3
subplot(2,1,1)
stem(n, x3)
title('x3')
% Plot do output para x3
subplot(2,1,2)
stem(n, fun_y(x3))
title('output para x1')
hold off

% Definição do sistema y
function y = fun_y(N)
    x0  = N;  %% For x[n]
    x1  = [N(1, 2:size(N, 2)) 0];  %% For x[n-1]
    xn1 = [0 N(1, 2:size(N, 2))]; %% For x[n+1]
    y = x0.^2 - x1 .* xn1;
end

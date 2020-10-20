%% Inicialização do ambiente
clear ; close all; clc

%% Exercício 9
n = 0:120; % janela
K = 3;

% Figura com os resultados
figure
% Plot da sequência X
subplot(3,1,1)
x = fun_x(n);
stem(n, x)
title('x')
% Plot do filtro de média 7 para X
subplot(3,1,2)
p = ones(1,2*K+1)/(2*K+1);
d = 1;
y = filter(p,d,x);
stem(n, y)
title('filtro de média de 7 elementos')
% Plot da correção do atraso observado
subplot(3,1,3)
y2a = filter(p, 1, [x zeros(1, K)]);
y2 = y2a(K+1:length(x)+K);
stem(n, y2)
title('y2')

% Definição da sequência X
function p = fun_x(N)
    r = (rand(1,size(N,2))-0.5)*(3/5);
    p = 3 * cos(0.1*pi*N) + 0.3 * sin(0.8*pi*N) + r;
end

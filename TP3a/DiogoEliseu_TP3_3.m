%% Inicialização do ambiente
clear ; close all; clc

%% Exercício 3
sintetico_data = fopen('sintetico.csv');
sintetico = textscan(sintetico_data, '%f', 'Delimiter', ',');
sintetico = sintetico{1,1};
fclose(sintetico_data);

figure(1)

subplot(2,1,1)
plot(sintetico);
title('sinal sintetico');

subplot(2,1,2)
DFT_Xa = fft(sintetico, N+1);
DFT_Xa = DFT_Xa(1 : (N+1)/2);
plot(X((N+1)/2, 0, 1),abs(DFT_Xa))
xlabel('\omega/\pi'), ylabel('|X(\omega)|'), title('DFT sintetico em [0, \pi]')


function f = X(N, inicio, fim)
f = (0:(1/N):(1 - 1/N))*(fim-inicio)+inicio;
end
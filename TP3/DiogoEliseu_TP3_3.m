%% Inicialização do ambiente
clear; close all; clc

%% Exercício 3
sintetico_data = fopen('sintetico.csv');
sintetico = textscan(sintetico_data, '%f', 'Delimiter', ',');
sintetico = sintetico{1,1};
fclose(sintetico_data);
N = length(sintetico);

Fs = 8;
f = linspace(0, 2*pi*Fs, N)/(pi*Fs);

T = 0.125;
t = (1:N)/N*T;

figure(1)

subplot(2,2,1)
plot(t, sintetico);
xlabel('t'), ylabel('x(t)'), title('sinal sintetico');

subplot(2,2,2)
DFT_Xa = fft(sintetico, N);
plot(f, abs(DFT_Xa))
xlabel('\omega/2\pi'), ylabel('|X(\omega)|'), title('DFT sintetico em [0, 2\pi]')

subplot(2,2,3)
low_pass_filter = ones(N,1);
low_pass_filter(81:177) = 0; % 2.5 H 5.5
DFT_Xa_filtered = DFT_Xa.*low_pass_filter;
plot(f, abs(DFT_Xa_filtered))
xlabel('\omega/2\pi'), ylabel('|Y(\omega)|'), title('DFT sintetico em [0, 2\pi] filtrada')

subplot(2,2,4)
plot(t, abs(ifft(DFT_Xa_filtered)));
xlabel('t'), ylabel('y(t)'), title('sinal sintetico filtrado');


function f = X(N, inicio, fim)
f = (0:(1/N):(1 - 1/N))*(fim-inicio)+inicio;
end

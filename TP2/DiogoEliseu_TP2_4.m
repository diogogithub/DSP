%% Inicialização do ambiente
clear ; close all; clc

% Definimos uma seed estatica para o gerador de números aleatórios de forma
% a podermos repetir os experimentos com resultados determinísticos
rng(42,'twister');


%% Exercício 4
%a)
N = 255;
n = 0:N;
X0 = 0.25.*n.*exp(-0.03.*n);
Ra = (cos(0.82*pi.*n) + sin(0.85*pi.*n) + sin(0.91*pi.*n) + cos(0.95*pi.*n))/4;
Rb = (0.6-(-0.6)).*rand(1,N+1) + (-0.6);

Xa = X0+Ra;
Xb = X0+Rb;
Xc = X0 + Ra + Rb .* Xa;

figure(1)
subplot(2,3,1)
plot(X0);
title("X0");
subplot(2,3,2)
plot(Ra);
title("Ra");
subplot(2,3,3)
plot(Rb);
title("Rb");
subplot(2,3,4)
plot(Xa);
title("Xa");
subplot(2,3,5)
plot(Xb);
title("Xb");
subplot(2,3,6)
plot(Xc);
title("Xc");

%b)
DFT_range1 = fft(Xa, N+1); % entre 0 e 2pi
DFT_range2 = [ DFT_range1((N+1)/2+1 : (N+1)) , DFT_range1(1 : (N+1)/2) ];
DFT_range3 = DFT_range1(1 : (N+1)/2);

figure(2)
subplot(2,3,1)
plot(X(N+1, 0, 2),abs(DFT_range1))
xlabel('\omega/2\pi'), ylabel('|X(\omega)|'), title('[0,2\pi]')

subplot(2,3,2)
plot(X(N+1, -1, 1),abs(DFT_range2))
xlabel('\omega/2\pi'), ylabel('|X(\omega)|'), title('[-\pi,\pi]')

subplot(2,3,3)
plot(X((N+1)/2, 0, 1),abs(DFT_range3))
xlabel('\omega/\pi'), ylabel('|X(\omega)|'), title('[0,\pi]')

subplot(2,3,4)
plot(X(N+1, 0, 2),abs(DFT_range1))
xlabel('\omega/2\pi'), ylabel('\theta(\omega)'), title('[0,2\pi]')

subplot(2,3,5)
plot(X(N+1, 0, 2),abs(DFT_range1))
xlabel('\omega/2\pi'), ylabel('\theta(\omega)'), title('[-\pi,\pi]')

subplot(2,3,6)
plot(X(N+1, 0, 2),abs(DFT_range1))
xlabel('\omega/\pi'), ylabel('\theta(\omega)'), title('[0,\pi]')

%c)
DFT_X0 = fft(X0, N+1);
DFT_X0 = DFT_X0(1 : (N+1)/2);

DFT_Ra = fft(Ra, N+1);
DFT_Ra = DFT_Ra(1 : (N+1)/2);

DFT_Rb = fft(Rb, N+1);
DFT_Rb = DFT_Rb(1 : (N+1)/2);

DFT_Xa = fft(Xa, N+1);
DFT_Xa = DFT_Xa(1 : (N+1)/2);

DFT_Xb = fft(Xb, N+1);
DFT_Xb = DFT_Xb(1 : (N+1)/2);

DFT_Xc = fft(Xc, N+1);
DFT_Xc = DFT_Xc(1 : (N+1)/2);

figure(3)
subplot(2,3,1)
plot(X((N+1)/2, 0, 1),abs(DFT_X0))
xlabel('\omega/\pi'), ylabel('|X(\omega)|'), title('X0')

subplot(2,3,2)
plot(X((N+1)/2, 0, 1),abs(DFT_Ra))
xlabel('\omega/\pi'), ylabel('|X(\omega)|'), title('Ra')

subplot(2,3,3)
plot(X((N+1)/2, 0, 1),abs(DFT_Rb))
xlabel('\omega/\pi'), ylabel('|X(\omega)|'), title('Rb')

subplot(2,3,4)
plot(X((N+1)/2, 0, 1),abs(DFT_Xa))
xlabel('\omega/\pi'), ylabel('|X(\omega)|'), title('Xa')

subplot(2,3,5)
plot(X((N+1)/2, 0, 1),abs(DFT_Xb))
xlabel('\omega/\pi'), ylabel('|X(\omega)|'), title('Xb')

subplot(2,3,6)
plot(X((N+1)/2, 0, 1),abs(DFT_Xc))
xlabel('\omega/\pi'), ylabel('|X(\omega)|'), title('Xc')




function f = X(N, inicio, fim)
f = (0:(1/N):(1 - 1/N))*(fim-inicio)+inicio;
end


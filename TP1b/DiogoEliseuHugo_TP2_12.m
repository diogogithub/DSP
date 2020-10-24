%% Inicialização do ambiente
clear ; close all; clc

%% Exercício 12
x = [1,2,3,4,1,2,3,4,1,2,3,4];
y = [2,1,2,3,-2,-1,2];

rxx = xcorr(x, x);
ryy = xcorr(y, y);
rxy = xcorr(x, y);
ryx = xcorr(y, x);

n1 = 1:12;
n2 = 1:7;
n3 = 1:23;
n4 = 1:13;

subplot(3,2,1),plot(n1, x)
xlabel('n'),title('x[n]') 
subplot(3,2,2),plot(n2, y)
xlabel('n'),title('y[n]') 
subplot(3,2,3),plot(n3, rxx)
xlabel('n'),title('rxx[n]') 
subplot(3,2,4),plot(n4, ryy)
xlabel('n'),title('ryy[n]') 
subplot(3,2,5),plot(n3, rxy)
xlabel('n'),title('rxy[n]') 
subplot(3,2,6),plot(n3, ryx)
xlabel('n'),title('ryx[n]') 
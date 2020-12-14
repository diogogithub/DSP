%% Inicialização do ambiente
clear ; close all; clc

%% Exercício 11
n = 0:255;
x = cos(20*pi*n/256)+cos(200*pi*n/256); 

cx1 = [0.5,0.4,0.3]; 
y1 = filter(cx1,1,x); 

cx2 = [0.4,0.5,0.4]; 
cy2 = [1,-0.5,0.4]; 
y2 = filter(cx2,cy2,x); 

subplot(3,1,1),plot(n,x) 
xlabel('n'),ylabel('Amplitude'),title('x[n]') 
subplot(3,1,2),plot(n,y1) 
xlabel('n'),ylabel('Amplitude'),title('y1[n]')
subplot(3,1,3),plot(n,y2)
xlabel('n'),ylabel('Amplitude'),title('y2[n]')
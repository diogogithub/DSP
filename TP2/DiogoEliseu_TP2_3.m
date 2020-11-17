%% Inicialização do ambiente
clear ; close all; clc

%% Exercício 3
% signals
N = 256;
n = (0:N-1);
X1 = 2.*n.*0.97.^n;
X2 = cos(6*pi.*n./N);
X3 = sin(12*pi.*n./N);

% time conv
X1_X2_t = conv(X1, X2);
X1_X3_t = conv(X1, X3);
X2_X3_t = conv(X2, X3);

% freq conv
X1_fft = fft([X1 zeros(1,N-1)]);
X2_fft = fft([X2 zeros(1,N-1)]);
X3_fft = fft([X3 zeros(1,N-1)]);
X1_X2_f = ifft(X1_fft.*X2_fft);
X1_X3_f = ifft(X1_fft.*X3_fft);
X2_X3_f = ifft(X2_fft.*X3_fft);

%--- plots

% signals
subplot(3,3,1)
plot(X1);
%title("Sinal X1")
xlabel("n")
ylabel("X1")
subplot(3,3,2)
plot(X2);
title("Sinais")
xlabel("n")
ylabel("X2")
subplot(3,3,3)
plot(X3);
%title("Sinal X3")
xlabel("n")
ylabel("X3")

x_axis = -(N-1):(N-1);

% time
subplot(3,3,4)
plot(x_axis, X1_X2_t);
%title("X1 * X2 no domínio do tempo")
xlabel("n")
ylabel("X1(t) * X2(t)")
subplot(3,3,5)
plot(x_axis, X1_X3_t);
title("*(t)")
xlabel("n")
ylabel("X1(t) * X3(t)")
subplot(3,3,6)
plot(x_axis, X2_X3_t);
%title("X2 * X3 no domínio do tempo")
xlabel("n")
ylabel("X2(t) * X3(t)")

% freq
subplot(3,3,7)
plot(x_axis, X1_X2_f);
%title("X1 * X2 no domínio da freq")
xlabel("n")
ylabel("X1(\omega) * X2(\omega)")
subplot(3,3,8)
plot(x_axis, X1_X3_f);
title("*(\omega)")
xlabel("n")
ylabel("X1(\omega) * X3(\omega)")
subplot(3,3,9)
plot(x_axis, X2_X3_f);
%title("X2 * X3 no domínio da freq")
xlabel("n")
ylabel("X2(\omega) * X3(\omega)")

%% Análise de Resultados
%[+] Para n = 256
% [>] conv demorou 0.000481
% [>] ifft demorou 0.001027
%
%[+] Para n = 1337
% [>] conv demorou 0.000601
% [>] ifft demorou 0.003004
%
%[+] Para n = 31337
% [>] conv demorou 0.456320
% [>] ifft demorou 0.038267
%
%[+] Para n = 424242
% [>] conv demorou 5.849966
% [>] ifft demorou 0.885959
%
%
% Verifica-se que para n pequenos temos conv mais eficiente do que ifft,
% Para n maiores temos ifft mais eficiente do que conv.

%% Inicialização do ambiente
clear ; close all; clc

%% Exercício 6
% signals
N = 256;
n = (0:N-1);
X1 = 2.*n.*0.97.^n;
X2 = cos(6*pi.*n./N);

% time conv
tic
X1_X2_t = conv(X1, X2);
tocked1 = toc;

% freq conv
tic
X1_fft = fft([X1 zeros(1,N-1)]);
X2_fft = fft([X2 zeros(1,N-1)]);
X1_X2_f = ifft(X1_fft.*X2_fft);
tocked2 = toc;

fprintf("[+] Para n = %d\n [>] conv demorou %f\n [>] ifft demorou %f\n\n",N, tocked1, tocked2);

N = 1337;
n = (0:N-1);
X1 = 2.*n.*0.97.^n;
X2 = cos(6*pi.*n./N);

% time conv
tic
X1_X2_t = conv(X1, X2);
tocked1 = toc;

% freq conv
tic
X1_fft = fft([X1 zeros(1,N-1)]);
X2_fft = fft([X2 zeros(1,N-1)]);
X1_X2_f = ifft(X1_fft.*X2_fft);
tocked2 = toc;

fprintf("[+] Para n = %d\n [>] conv demorou %f\n [>] ifft demorou %f\n\n",N, tocked1, tocked2);

N = 31337;
n = (0:N-1);
X1 = 2.*n.*0.97.^n;
X2 = cos(6*pi.*n./N);

% time conv
tic
X1_X2_t = conv(X1, X2);
tocked1 = toc;

% freq conv
tic
X1_fft = fft([X1 zeros(1,N-1)]);
X2_fft = fft([X2 zeros(1,N-1)]);
X1_X2_f = ifft(X1_fft.*X2_fft);
tocked2 = toc;

fprintf("[+] Para n = %d\n [>] conv demorou %f\n [>] ifft demorou %f\n\n",N, tocked1, tocked2);

N = 424242;
n = (0:N-1);
X1 = 2.*n.*0.97.^n;
X2 = cos(6*pi.*n./N);

% time conv
tic
X1_X2_t = conv(X1, X2);
tocked1 = toc;

% freq conv
tic
X1_fft = fft([X1 zeros(1,N-1)]);
X2_fft = fft([X2 zeros(1,N-1)]);
X1_X2_f = ifft(X1_fft.*X2_fft);
tocked2 = toc;

fprintf("[+] Para n = %d\n [>] conv demorou %f\n [>] ifft demorou %f\n",N, tocked1, tocked2);

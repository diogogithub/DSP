%% Exercício 2

N = (0:15);

x1 = ones(1,16);
x2 = cos(3*pi.*N./8);

DFT1 = fft(x1, 16);
DTFT1 = fft(x1, 1024);

DFT2 = fft(x2, 16);
DTFT2 = fft(x2, 1024);

subplot(2,1,1)
stem(x2)
subplot(2,1,2)
hold on
stem(X(16),abs(DFT2))
plot(X(1024), abs(DTFT2))
hold off
xlabel('cenas'), ylabel('Modulo'), title('DFT / DTFT de x2')

function f = X(N)
f = 0:(1/N):(1 - 1/N);
end
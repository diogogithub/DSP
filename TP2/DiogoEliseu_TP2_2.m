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
xlabel('n'), ylabel('Amplitude'), title('Sinal x2')

subplot(2,1,2)
hold on
stem(X(16), abs(DFT2), "LineStyle", "none")
plot(X(1024), abs(DTFT2))
xlabel('\omega/2\pi'), ylabel('Modulo'), title('DFT / DTFT de x2')
hold off

function f = X(N)
f = 0:(1/N):(1 - 1/N);
end
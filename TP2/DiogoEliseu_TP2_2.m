%% Exercício 2

w1 = (0:15) * 2 * pi / 16;
w2 = (0:1023) * 2 * pi / 1024;
x1 = ones(1,16);
x2 = cos(3 * pi * (0:15) / 8);

DFT1 = fft(x1);
DTFT1 = fft(x1, 1024);

DFT2 = fft(x2);
DTFT2 = fft(x2, 1024);

subplot(2,1,1)
plot(w1, abs(DFT1), w2, abs(DTFT1))
xlabel('cenas'), ylabel('Modulo'), title('DFT / DTFT de x1')
subplot(2,1,2)
plot(w1, abs(DFT2), w2, abs(DTFT2))
xlabel('cenas'), ylabel('Modulo'), title('DFT / DTFT de x2')
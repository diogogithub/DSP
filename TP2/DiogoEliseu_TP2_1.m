%% Exercício 1

p = [1.8, 0.5, -0.3];
d = [1, 0.5];
w = 0:(4*pi/1023):2*pi;
y2a = freqz(p, d, w);
X = freqz(p, d, w);

subplot(2,1,1),plot(w, abs(X))
xlabel('w'),title('Magnitude')
subplot(2,1,2),plot(w, angle(X))
xlabel('w'),title('Phase')
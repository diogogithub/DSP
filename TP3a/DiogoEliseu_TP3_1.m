%% Exercício 1
figure(1)
num = [ 1 -1 ];
den = [ 1 -0.2 ];
subplot(2,1,1)
h60 = impz(num, den, 60);
stem(h60,'filled')
subplot(2,1,2)
[z, p, ~] = tf2zp(num, den);
zplane(z, p)

figure(2)
num = [ 4.5 -1.3 1.4 ];
den = [ 1 0.2 0.75 -0.27 ];
subplot(2,1,1)
h60 = impz(num, den, 60);
stem(h60,'filled')
subplot(2,1,2)
[z, p, ~] = tf2zp(num, den);
zplane(z, p)

figure(3)
num = [ 0.5 ];
den = [ 1 -1 0.15 ];
subplot(2,1,1)
h60 = impz(num, den, 60);
stem(h60,'filled')
subplot(2,1,2)
[z, p, ~] = tf2zp(num, den);
zplane(z, p)

figure(4)
num = [ 3 4.5 ];
den = [ 1 -2.9 -2.1 ];
subplot(2,1,1)
h60 = impz(num, den, 60);
stem(h60,'filled')
subplot(2,1,2)
[z, p, ~] = tf2zp(num, den);
zplane(z, p)

figure(5)
num = [ 1 ];
den = [ 1 -1.845 0.850856 ];
subplot(2,1,1)
h60 = impz(num, den, 60);
stem(h60,'filled')
subplot(2,1,2)
[z, p, ~] = tf2zp(num, den);
zplane(z, p)

figure(6)
num = [ 1 ];
den = [ 1 -1.85 0.85 ];
subplot(2,1,1)
h60 = impz(num, den, 60);
stem(h60,'filled')
subplot(2,1,2)
[z, p, k] = tf2zp(num, den);
zplane(z, p)
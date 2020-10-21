%% Inicialização do ambiente
clear ; close all; clc

%% Exercício 11
n = 0:255; %% Inicialização do ambiente


x = cos((20 * pi * n)/256) + cos((200 * pi * n)/256);

figure
subplot(3, 1, 1)
stem(n, x)

subplot(3, 1, 2)
y1 = 0.5 * x + 0.4 * [x(1, 2:size(x, 2)) 0] + 0.3 * [x(1, 3:size(x, 2)) 0 0];
stem(n, y1)

subplot(3, 1, 3)
y2 = zeros(size(n));
y2(1) = y1(1);
y2(2) = y1(2);
for i = 3:255
    y2(i) = y1(i) + 0.5 * y2(i - 1) - 0.4 * y2(i - 2);
end
stem(n, y2)

%% Inicialização do ambiente
clear ; close all; clc

%% Exercício 4
fc = 0.3;
w = linspace(0, pi, 500); %0:pi/500:pi;
f = w/pi;
order = [ 4, 6, 8, 10];

for i=1:4
    % Butterworth
    subplot(3,4,i)
    [num, den] = butter(order(i), fc, 'low'); %order, cutoff frequency, type
    h = freqz(num, den, w);
    gain = 20.*log10(abs(h));
    plot(f, gain);
    axis([0 1 -60 2]);
    title(['Butterworth - ' num2str(order(i)) '.ª Ordem']);
    ylabel("Ganho (dB)"); xlabel("\omega/\pi");
    
    % Chebyshev
    subplot(3,4,i+4)
    [num, den] = cheby1(order(i), 0.5, fc, 'low'); %0.5 is tollerance in dB
    h = freqz(num, den, w);
    gain = 20.*log10(abs(h));
    plot(f, gain);
    axis([0 1 -60 2]);
    title(['Chebyshev - ' num2str(order(i)) '.ª Ordem']);
    ylabel("Ganho (dB)"); xlabel("\omega/\pi");
    
    % Eliptico
    subplot(3,4,i+4+4)
    [num, den] = ellip(order(i), 0.5, 40, fc, 'low'); %0.5 is the tollerance in the top, -40 is the tollerance in the bottom
    h = freqz(num, den, w);
    gain = 20.*log10(abs(h));
    plot(f, gain);
    axis([0 1 -60 2]);
    title(['Eliptico - ' num2str(order(i)) '.ª Ordem']);
    ylabel("Ganho (dB)"); xlabel("\omega/\pi");
end

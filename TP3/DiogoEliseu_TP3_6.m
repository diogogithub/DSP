%% Inicialização do ambiente
clear; close all; clc

%% Exercício 6
sintetico_data = fopen('sintetico.csv');
sintetico = textscan(sintetico_data, '%f', 'Delimiter', ',');
sintetico = sintetico{1,1};
fclose(sintetico_data);

fn = [0.91, 0.85, 0.91, 0.95];

xf = DiogoEliseu_TP3_6f(sintetico, fn(1), 0);
for i=2:(length(fn)-1)
    %figure(i)
    xf = DiogoEliseu_TP3_6f(xf, fn(i), 0);
end
figure(1)
DiogoEliseu_TP3_6f(xf, fn(length(fn)), 1);


function filtrado = DiogoEliseu_TP3_6f(xo,fn,graf)
    Ls = length(xo);
    d = fdesign.notch('N,F0,Q', 8, fn, 10);
    Hd = design(d);
    SOS = Hd.SOS;
    G = Hd.ScaleValues;
    [num, den] = sos2tf(SOS, G);
    w_2pi = linspace(0, 2*pi, length(xo))/pi;
    w_pi = w_2pi(1:(length(w_2pi)/2));
    h = freqz(num, den, w_2pi);
    gain = 20.*log10(abs(h));
    [z, p, ~] = tf2zp(num, den);
    filtrado = filter(num, den, xo);
    if (graf == 1)
        subplot(2,3,1)
        plot(xo)
        xlabel('t'), ylabel('xo[t]'), title('sinal xo');
        
        subplot(2,3,2)
        plot(filtrado)
        xlabel('t'), ylabel('filtrado[t]'), title('sinal filtrado');
        
        subplot(2,3,3)
        DFT_xo = fft(xo);
        DFT_xo_pi = DFT_xo(1 : (Ls)/2);
        plot(w_pi, abs(DFT_xo_pi));
        xlabel('\omega/\pi'), ylabel('|X(\omega)|'), title('DFT xo em [0, \pi]')
        
        subplot(2,3,4)
        DFT_filtrado = fft(filtrado);
        DFT_filtrado_pi = DFT_filtrado(1 : (Ls)/2);

        plot(w_pi, abs(DFT_filtrado_pi));
        xlabel('\omega/\pi'), ylabel('|X(\omega)|'), title('DFT xo filtrado em [0, \pi]')
        
        subplot(2,3,5)
        plot(w_2pi, gain);
        ylabel("Ganho (dB)"); xlabel("\omega/2\pi"); title('Ganho do filtro');
        
        subplot(2,3,6)
        zplane(z, p)
        title("Diagrama de Zeros e Polos");
    end
end


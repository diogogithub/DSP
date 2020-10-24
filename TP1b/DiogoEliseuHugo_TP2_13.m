%% Exercício 13
function [Vmax, Lmax] = DiogoEliseuHugo_TP2_13(X, Y, GRAF)
    n1 = 1:size(X, 2);
    n2 = 1:size(Y, 2);
    n3 = 1:(size(X, 2) * 2) - 1;
    n4 = 1:(size(Y, 2) * 2) - 1;
    n5 = 1:(max(size(X, 2), size(Y, 2)) * 2) - 1;
    
    rxx = xcorr(X, X);
    ryy = xcorr(Y, Y);
    X0 = max(rxx);
    Y0 = max(ryy);
    R0xx = rxx / X0;
    R0yy = ryy / Y0;
    R0xy = xcorr(X, Y) / sqrt(X0 * Y0);
            
    if (GRAF == 1)
        subplot(5,1,1),plot(n1, X)
        xlabel('n'),title('$x[n]$', 'Interpreter', 'latex', 'FontSize', 14) 
        subplot(5,1,2),plot(n2, Y)
        xlabel('n'),title('$y[n]$', 'Interpreter', 'latex', 'FontSize', 14) 
        subplot(5,1,3),plot(n3, R0xx)
        xlabel('n'),title('$\rho_{xx} [n]$', 'Interpreter', 'latex', 'FontSize', 14) 
        subplot(5,1,4),plot(n4, R0yy)
        xlabel('n'),title('$\rho_{yy} [n]$', 'Interpreter', 'latex', 'FontSize', 14) 
        subplot(5,1,5),plot(n5, R0xy)
        xlabel('n'),title('$\rho_{xy} [n]$', 'Interpreter', 'latex', 'FontSize', 14) 
    end
    
    Vmax = max(R0xy);
    Lmax = find(R0xy == Vmax, 1);
end
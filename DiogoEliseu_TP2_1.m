% Exercício 1
impulso = zeros(1,41);
impulso(21) = 1;
degrau = (n>=0);
n = -20:20;

x = fun_x(n);
figure
stem(n, x)

figure
stem(n, impulso)

figure
stem(n, degrau)

function p = fun_x(N)
    A=1.8;
    f=0.05;
    phi=0.5*pi;
    p=A*cos(2*pi*f*N+phi);
end
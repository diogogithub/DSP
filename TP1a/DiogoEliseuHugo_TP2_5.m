%% Exercício 5
function DiogoEliseuHugo_TP2_5(X)
    plot(X);
    fprintf('L_1: %d\n', norma(X,1));
    fprintf('L_2: %f\n', norma(X,2));
    fprintf('L_3: %f\n', norma(X,3));
    fprintf('L_{infinity}: %d\n', max(abs(X)));
    fprintf('Energia: %f\n', sum(abs(X).^2));
    fprintf('Potência média: %f\n', sum(X.^2) / length(X));
end

function s = norma(X, P)
    s = sum(abs(X).^P).^(1/P);
end

%% Exercício 6
function er = DiogoEliseuHugo_TP2_6(X1,X2)
    er = norma(X2-X1,2) / norma(X1,2);
end

function s = norma(X, P)
    s = sum(abs(X).^P).^(1/P);
end
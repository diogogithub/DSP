%% Exercício 14

function RefN = DiogoEliseuHugo_TP2_14(X)
    N = 1:size(X, 2);
    ref = [sin(N); exp(N); exp(-N); N; -N; N.^2];
    maxim = [];
    
    for s = ref'
        Vmax = DiogoEliseuHugo_TP2_13(X, s', 1);
        maxim = [maxim Vmax];
    end
    
    m = max(maxim);
    RefN = find(maxim == m, 1);
end
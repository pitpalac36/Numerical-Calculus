function x = gauss(A, b)
    A = [A, b];
    for k=1:length(b)-1
        [~, poz] = max(abs(A(k:end, k)));
        poz = poz + k -1;
        if poz~=k
            A([k, poz], k:end) = A([poz, k], k:end);
        end
        for j=k+1:length(b)
            m = A(j,k) / A(k, k);
            A(j, k:end) = A(j, k:end) - A(k, k:end) * m;
        end
    end
    b = A(:, end);
    A(:, end) = [];
    x = backwards_substitution(A, b);
end
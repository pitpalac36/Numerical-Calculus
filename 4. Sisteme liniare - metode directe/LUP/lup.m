function [L,U,P]=lup(A)
% descompunerea LUP a matricei A
% A - matricea de descompus
% L -lower triangle
% U - upper triangle
% P - matricea identitate cu liniile permutate

[m,n] = size(A);
P = zeros(m,n);
piv = (1:m)'; % matrice coloana

for i=1:m-1
    % caut valoarea maxima (+ pozitia) unde sa fac pivotarea
    [~,ppoz] = max(abs(A(i:m,i)));
    ppoz = ppoz+i-1; % pozitie pivot
    
    if i~=ppoz
        %interschimbare linii daca pivotul nu e egal cu linia curenta
        A([i,ppoz],:) = A([ppoz,i],:);
        piv([i,ppoz]) = piv([ppoz,i]);
    end
    % determinare complement Schur
    row = i+1:m;
    A(row,i) = A(row,i)/A(i,i);
    A(row,row) = A(row,row)-A(row,i)*A(i,row);
end
for i=1:m
    P(i,piv(i)) = 1;
end

U = triu(A);
L = tril(A,-1);
L = L+eye(m);
end
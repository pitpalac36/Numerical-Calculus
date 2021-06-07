function fi=getLambda(x, xi)
[mu,nu]=size(xi);
fi=zeros(mu,nu);
n=length(x);
for i=1:n
    lk=ones(mu,nu);
    for j=[1:i-1,i+1:n]
        lk=lk.*(xi-x(j))/(x(i)-x(j));
    end
    fi=fi+abs(lk);
end
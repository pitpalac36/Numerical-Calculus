function [g_nodes,g_coeff]=Gauss_Jacobimodificat(n,a,b)
k=0:n-1; 
k1=1:n-1;
k2=2:n-1;
bet1=4*(1+a)*(1+b)/((2+a+b)^2)/(3+a+b);
bet=[2^(a+b+1)*beta(a+1,b+1), bet1, 4*k2.*(k2+a+b).*(k2+a).*...
        (k2+b)./(2*k2+a+b-1)./(2*k2+a+b).^2./(2*k2+a+b+1)];
if a==b
    alpha=zeros(1,n);
else    
    alpha=[(b-a)./(a+b+2),(b^2-a^2)./(2*k1+a+b)./(2*k1+a+b+2)];
end
[g_nodes,g_coeff]=Gaussquad(alpha,bet);
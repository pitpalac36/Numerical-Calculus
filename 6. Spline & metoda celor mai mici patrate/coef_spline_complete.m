% determina coeficientii unui spline cubic
% x - valorile nodurilor
% f - valorile functiei in nodurile x
function [a,b,c,d]=coef_spline_complete(x,f)
    derivate=[0,0]; 
    n=length(x);
    if any(diff(x)<0)
        [x,ind]=sort(x); 
    else
        ind=1:n; 
    end
    y=f(ind); x=x(:); y=y(:);
    dx=diff(x);  ddiv=diff(y)./dx;
    ds=dx(1:end-1); dd=dx(2:end);
    dp=2*(ds+dd);
    md=3*(dd.*ddiv(1:end-1)+ds.*ddiv(2:end));
    dp1=1; dpn=1; vd1=0; vdn=0;
    md1=derivate(1); mdn=derivate(2);
    dp=[dp1;dp;dpn];
    dp1=[0;vd1;dd];
    dm1=[ds;vdn;0];
    md=[md1;md;mdn];
    A=spdiags([dm1,dp,dp1],-1:1,n,n);
    m=A\md;
    d=y(1:end-1);
    c=m(1:end-1);
    a=(m(2:end)+m(1:end-1)-2*ddiv)./(dx.^2);
    b=(ddiv-m(1:end-1))./dx-dx.*a;
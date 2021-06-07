% determina coeficientii unui spline cubic deBoor
% x - valorile nodurilor
% f - valorile functiei in nodurile x
function [a,b,c,d]=coef_spline_deBoor(x,f)
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
    x31=x(3)-x(1);xn=x(n)-x(n-2);
    dp1=dx(2); dpn=dx(end-1);
    vd1=x31;
    vdn=xn;
    md1=((dx(1)+2*x31)*dx(2)*ddiv(1)+dx(1)^2*ddiv(2))/x31;
    mdn=(dx(end)^2*ddiv(end-1)+(2*xn+dx(end))*dx(end-1)*ddiv(end))/xn;
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
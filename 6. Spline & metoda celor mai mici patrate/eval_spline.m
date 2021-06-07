% x - nodurile
% a,b,c,d - coeficientii
% t - punctele in care se face evaluarea
function z = eval_spline(x,a,b,c,d,t)
    n=length(x);
    x=x(:); 
    t=t(:);
    k = ones(size(t));
    for j = 2:n-1
        k(x(j) <= t) = j;
    end
    % se evalueaza interpolantul
    s = t - x(k);
    z = d(k) + s.*(c(k) + s.*(b(k) + s.*a(k)));
end
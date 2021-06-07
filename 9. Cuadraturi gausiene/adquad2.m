% determina valoarea aprox a integralei
% f - functia
% a, b - limita inferioara si limita superioara
function I = adquad2(f, a, b)
tol = 1e-3;
c = (a + b)/2;
fa = f(a);
fb = f(b); 
fc = f(c); 
I = quadstep(f, a, b, tol, fa, fc, fb);
% calculeaza recursiv valoarea aproximativa a integralei
% f - functia
% a,b - limita inferioara si limita superioara
% tol - toleranta
% fa = f(a), fb = f(b), fc = f(c)
function I = quadstep(f, a, b, tol, fa, fc, fb)
h = b - a;
c = (a + b)/2;
fd = f((a+c)/2);
fe = f((c+b)/2);
Q1 = h/6 * (fa + 4*fc + fb);
Q2 = h/12 * (fa + 4*fd + 2*fc + 4*fe + fb);
if abs(Q2 - Q1) <= tol
    I = Q2 + (Q2 - Q1)/15;
else
    Ia = quadstep(f, a, c, tol, fa, fd, fc);
    Ib = quadstep(f, c, b, tol, fc, fe, fb);
    I = Ia + Ib;
end
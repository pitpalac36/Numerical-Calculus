% f - functia de integrat
% a,b - limitele de integrare
% tol - toleranta
% met - o cuadratura repetata
function I = adquadDivideEtImpera(f,a,b,tol,met)
m = 100;
I1 = met(f,a,b,tol,m);
I2 = met(f,a,b,tol,2*m);
if abs(I1 - I2) < tol
    I = I2;
else 
    Ia = adquad(f,a,(a+b)/2,tol,met);
    Ib = adquad(f,(a+b)/2,b,tol,met);
    I = Ia + Ib;
end
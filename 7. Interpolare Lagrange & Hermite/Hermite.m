function pxi = Hermite(x, y, dy, xi)
[z, Q] = difdiv(x, y, dy);
lx = length(xi);
lz = length(z);
 
for i = 1:lx
    x_diff = xi(i) - z;
    y(i) = [1, cumprod(x_diff(1:lz-1))]*Q';
end
pxi = y;
end
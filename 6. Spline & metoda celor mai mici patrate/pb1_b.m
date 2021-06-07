a = -pi;
b = pi;
xx = linspace(a, b, 200);
n = 10;

f = @(x) x + sin(x .^ 2);
x = linspace(a, b, n);
y = f(x);


rng = [1:n];
E = [ones(size(x')), x'.^rng];

c = E\y';

yy_echidist = [ones(size(xx')), xx'.^rng]*c;

figure(1);
hold on;
plot(x, y, 'o');
plot(xx, f(xx));
plot(xx, yy_echidist);
legend('noduri echidistante', 'f(x)', 'aprox folosind mcmmp', 'Location', 'BestOutside');

x = sort((a+b)/2 + (b-a)/2*cos((2*[1:n]-1)*pi/(2*n)));
y = f(x);

E = [ones(size(x')), x'.^rng];

c = E\y';

yy_cheb = [ones(size(xx')), xx'.^rng]*c;

figure(2);
hold on;
plot(x, y, 'o');
plot(xx, f(xx));
plot(xx, yy_cheb);
legend('noduri Cebisev', 'f(x)', 'aprox folosind mcmmp', 'Location', 'BestOutside');
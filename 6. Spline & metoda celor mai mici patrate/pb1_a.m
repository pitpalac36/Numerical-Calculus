a=-pi;
b=pi;
xx = linspace(a, b, 200);
n = 10;

% f si derivatele de ordinul 1 respectiv 2
f = @(x) x + sin(x .^ 2 );
df = @(x) 1 + 2 .* x.* cos(x .^ 2 );
ddf = @(x) 2 .* cos(x .^ 2 ) - 4 .* x .^2 .* sin(x .^ 2);

x = linspace(a, b, 10);
y = f(x);

% spline complete
[a1, b1, c1, d1] = coef_spline_complete(x, y);
yy_complete = eval_spline(x, a1, b1, c1, d1, xx);

% spline cu derivate de ordin 2
[a2, b2, c2, d2] = coef_spline_derOrd2(x, y, [ddf(a), ddf(b)]);
yy_ord2 = eval_spline(x, a2, b2, c2, d2, xx);

% spline naturale
[a3, b3, c3, d3] = coef_spline_naturale(x, y);
yy_natural = eval_spline(x, a3, b3, c3, d3, xx);

% spline deBoor
[a4, b4, c4, d4] = coef_spline_deBoor(x, y);
yy_boor = eval_spline(x, a4, b4, c4, d4, xx);

% plot pentru f si aproximante folosind noduri echidistante
figure(1);
hold on;
plot(x, y, 'o');
plot(xx, f(xx));
plot(xx, yy_complete);
plot(xx, yy_ord2);
plot(xx, yy_natural);
plot(xx, yy_boor);

legend('noduri echidistante', 'f(x)', 'complete', 'cu derivate de ord 2', 'natural', 'deBoor', 'Location', 'BestOutside');

x = sort(1/2*(a+b) + 1/2*(b-a)*cos(((2*[0:n] + 1)*pi/(2*n + 2))));

y = f(x);

% spline complete
[a1, b1, c1, d1] = coef_spline_complete(x, y);
yy_complete = eval_spline(x, a1, b1, c1, d1, xx);

% spline cu derivate de ordin 2
[a2, b2, c2, d2] = coef_spline_derOrd2(x, y, [ddf(a), ddf(b)]);
yy_ord2 = eval_spline(x, a2, b2, c2, d2, xx);

% spline naturale
[a3, b3, c3, d3] = coef_spline_naturale(x, y);
yy_natural = eval_spline(x, a3, b3, c3, d3, xx);

% spline deBoor
[a4, b4, c4, d4] = coef_spline_deBoor(x, y);
yy_boor = eval_spline(x, a4, b4, c4, d4, xx);

% plot pentru f si aproximante folosind noduri Cebisev
figure(2);
hold on;
plot(x, y, 'o');
plot(xx, f(xx));
plot(xx, yy_complete);
plot(xx, yy_ord2);
plot(xx, yy_natural);
plot(xx, yy_boor);

legend('noduri cebisev', 'f(x)', 'complete', 'cu derivate de ord 2', 'natural', 'deBoor', 'Location', 'BestOutside');
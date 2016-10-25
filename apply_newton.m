%show graph
plt_func

f = @(x) 12 - 26.*x + 20.*x.^2 - 7.*x.^3 -12.*exp(x-2) + 14 .*x.*exp(x-2)
% Settings
approx1 = 0.2  % Approximation for f(x) = 0 poor guess to get many rep.
approx2 = 1.9
tol1 = 1e-9
tol2 = 1e-9
rep = 20
% Derivitive.
df = @(x) -21.*x.^2+40.*x+14.*x.*exp(x-2)+2.*exp(x-2)-26;
ddf = @(x) 14.*x.*exp(x-2)-42.*x + 16.*exp(x-2)+40;
% Find error with nownon.
xn1 = newton(f, df, approx1, tol1, tol2, rep);
xn2 = newton(f, df , approx2, tol1, tol2, rep);
% Write data to disk.
t_writer(xn1, xn2);
% Roots
root = [0.857142857142857 2.0]
root(1) = fzero(f, 0.8);
% Calculate error
[Ei1 Er1 Er12 ] = calcerror(xn1, root(1));
[Ei2 Er2 Er22 ] = calcerror(xn2, root(2));
% Save the error to disk
t_writer2('table_t1.dat', Ei1, Er1,Er12)
t_writer2('table_t2.dat', Ei2, Er2,Er22)

A1 = Er1(end)
A2 = Er2(end)
M = abs(ddf(root(1)))/abs((2*df(root(1))))

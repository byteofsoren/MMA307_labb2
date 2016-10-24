%show graph
%plt_func

%solve for y=0 
f = @(x) 12 - 26.*x + 20.*x.^2 - 7.*x.^3 -12.*exp(x-2) + 14 .*x.*exp(x-2)
newton(f, 0.8, 1*10^-9, 0.1, 200000)

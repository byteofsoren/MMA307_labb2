function plt_func()

    f = @(x) 12 - 26.*x + 20.*x.^2 - 7.*x.^3 -12.*exp(x-2) + 14 .*x.*exp(x-2)
    x = linspace(0,3);
    plot(x,f(x))
    grid on;
end

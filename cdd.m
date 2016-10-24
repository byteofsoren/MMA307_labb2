function y = cdd(f,x)
    % returns the derivitive of the function f = f(x) at the point x 
    % the delta h is epsilon.
    h = 0.05;
    y = (f(x+h)-f(x-h))./(2.*h);
end

%show graph
%plt_func

%solve for y=0 
f = @(x) 12 - 26.*x + 20.*x.^2 - 7.*x.^3 -12.*exp(x-2) + 14 .*x.*exp(x-2)

approx1 = 0.2
approx2 = 1.9
tol1 = 1e-9
tol2 = 1e-9
rep = 20
df = @(x) -21.*x.^2+40.*x+14.*x.*exp(x-2)+2.*exp(x-2)-26;
ddf = @(x) 14.*x.*exp(x-2)-42.*x + 16.*exp(x-2)+40;


xn1 = newton(f, df, approx1, tol1, tol2, rep);
xn2 = newton(f, df , approx2, tol1, tol2, rep);

t_writer(xn1, xn2);


root = [0.857142857142857 2.0]
root(1) = fzero(f, 0.8);
%abserror = [(abs(root(1)-xnewton(1)(end))) (abs(root(2)-xnewton(2)(end)))]

%relerror1 = abserror1/

%for each root calculate the error

[Ei1 Er1 Er12 ]= calcerror(xn1, root(1));
[Ei2 Er2 Er22 ] = calcerror(xn2, root(2));
len1 = min(length(Ei1),length(Er1));
len1 = min(len1, length(Er12));
len2 = min(length(Ei2),length(Er2));
len2 = min(len2, length(Er22));



%T1 = table(Ei1, Er1, Er12)
T1 = table(Ei1(1:len1)', Er1(1:len1)', Er12(1:len1)');
T2 = table(Ei2(1:len2)', Er2(1:len2)', Er22(1:len2)');
T1.Properties.VariableNames={'abs'  'rel'  'rel2'}
T2.Properties.VariableNames={'abs'  'rel'  'rel2'}
writetable(T1, 'table_t1.dat', 'WriteVariableNames', true)
writetable(T2, 'table_t2.dat', 'WriteVariableNames', true)


M = abs(ddf(root(1)))/abs((2*df(root(1))))

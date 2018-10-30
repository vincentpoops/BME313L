x = 4.5; %initial guess
n = 0; %initialize counter
e = 1;
while e > .000003 %loop while error is high
    n = n+1; %update counter
    iter(n) = n; %store n
    fxi(n) = cos(x) - .5* x^2;
    fprimex(n) = -sin(x)-x;
    xi = x - fxi(n)/fprimex(n); %newton's method
    e = abs((xi - x)/xi); %approximate error
    x = xi; %update guess
    nextxi(n) = x; %stores xi and error
    Ea(n) = e*100; %makes percent and stores
end
A = [iter;nextxi;fxi;fprimex;Ea]; %matrix of all the arrays
fprintf('Iteration \t xi+1 \t\t f(xi) \t\t   f''(x)  \t\t|Ea|\n') %prints column titles
fprintf('\t%d\t\t %f\t %f\t   %f   \t%g\n',A) %prints columns
g = .9; %given constants
mua = .1;
mus = 100;
xi1 = .12; %given guesses
xi = .13;
phir = .3; %finding for this value
D = (mua + mus*(1-g))/3;
delta = sqrt(D/mua);
e = 1; %starts error at something other than 0
n = 0; %initialize counter
while e > .0001
    n = n + 1; %counter
    iter(n) = n; %array for counter 
    fxi = exp(-xi/delta)/4/pi/D/xi-phir; %function
    fxin(n) = fxi; %array
    fxi1 = exp(-xi1/delta)/4/pi/D/xi1-phir; %function w/ previous fxi
    fxi1n(n) = fxi1; %array
    nextxi = xi - fxi*(xi1-xi)/(fxi1-fxi); %secant method
    xi1 = xi; %updates guesses
    xi1n(n) = xi1; %array for guess
    xi =  nextxi; %updates guesses
    xin(n) = xi; %array for guess
    e = abs((xi - xi1n(n))/xi); %calculates error
    Ea(n) = e * 100; %error array
end
A = [iter;xin;xi1n;fxin;fxi1n;Ea]; %matrix of arrays
fprintf('Iteration \t xi \t\t xi_1   \t f(xi) \t\t f(xi_1) \t|Ea|\n') %creates table
fprintf('\t%d\t\t%f \t%f \t%+f \t%+f \t%f\n',A)

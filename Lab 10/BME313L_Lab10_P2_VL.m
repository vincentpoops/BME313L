H = 30; %height of mast
F = @(z) 100*(z./(5+z)).*exp(-2*z/H); %function

%romberg
[a,error,n] = romberg_VL(F,0,H,.5);

%Gauss-Legendre
w = [-1/sqrt(3) 1/sqrt(3)]; %weights in 2-point gauss-legendre
x = @(xd) ((H+0)+(H-0).*xd)./2; %x->xd
v = (H-0)/2; %dx -> dxd
I = sum(F(x(w))*v); %transformed Gauss-Legendre

%quads
d = quad(F,0,H,0.5); %simpson quad
e = quadl(F,0,H,0.5); %lobatto quad

iter = [0,1:n]'; %iteration vector
er = [inf,error]'; %error vector
A = [iter,a',er,]'; %matrix for output
fprintf('Using Romberg Integration:\nIteration\t\t\tIntegral Estimate Calculations\t\t\t  Approximate Error(%%)\n') %output
fprintf('\t%d\t\t%f\t%f\t%f\t%f\t\t  %f\n',A)
fprintf('(The first value of every row is the Integral Estimate for the corresponding Iteration)\n')
fprintf('The value of the integral using Two-point Gauss-Legendre is \n%f.\n',I)
fprintf('The value of the integral using quad and quadl is\n%f and %f, respectively.\n',d,e)

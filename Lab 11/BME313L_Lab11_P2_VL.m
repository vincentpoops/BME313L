f =@(x) exp(-2*x)-x; %function
h = .5:-.01:.01; %step size
n = 2; %point for derivative
%improved forward finite difference approximation
a = (-f(n+2*h)+4*f(n+h)-3*f(n))./(2.*h);
%improved backward finite difference approximation
b = (3*f(n)-4*f(n-h)+f(n-2*h))./(2.*h);
%centered finite difference approximation
c = (f(n+h)-f(n-h))./(2.*h);
%improved centered finite difference approximation
d = (-f(n+2*h)+8*f(n+h)-8*f(n-h)+f(n-2*h))./(12.*h);
%plot
plot (h,a,h,b,h,c,h,d) %plot
legend('Improved Forward Finite Difference Approximation','Improved Backward Finite Difference Approximation','Centered Finite Difference Approximation','Improved Centered Finite Difference Approximation') %formatting
xlabel('dx')
ylabel('Derivative Approximation')
title('Plot of Various Finite Difference Approximations of a Function')
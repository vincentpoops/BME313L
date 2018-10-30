clear all; close all; clc; %resets everything
F1 = 400; %flow in y direction
F2 = 800; %flow in x direction
F = F2/F1; %ratio of flows (simplifying)
K = 5; %given constant
a = -(1+F*K); %for the sake of simplification
B = F*K; %for the sake of simplification
A = [a B 0 0 0;1 a B 0 0;0 1 a B 0;0 0 1 a B;0 0 0 1 a]; %matrix of coefficients for gauss elimination
b = [-.1;0;0;0;0]; %right side of equations
e = [0;1;1;1;1]; %diagonals for Tridiag
f = [-11;-11;-11;-11;-11];
g = [10;10;10;10;0];
r = b;
y = Tridiag_VL(e,f,g,r); %calls Tridiag function
yg = GaussPivot_VL(A,b); %calls GaussPivot function
xout = y(1) * K; %calculates xout using equation 2 and solution from tridiag
xgout = yg(1) * K; %calculates xout using equation 2 and solution from gauss elimination
fprintf('The values for yout and xout, when solved with tridiag, are\n') %formatting
fprintf('%f and %f, respectively.\n\n',y(5),xout)
fprintf('When the same set of equations is solved with GaussPivot, yout and xout are\n')
fprintf('%f and %f, respectively.\n\n',yg(5),xgout)
if y(5) == yg(5) & xout == xgout
    fprintf('These values check out.\n')
else
    fprintf('These values do not check out.\n')
end
clear all; close all; clc; %resets everything
ex = 1; %initialize errors
ey = 1;
c = 0; %initialize counter
x = 1.2; %initial guesses
y = 1.2;
while ex > .00001 | ey > .00001
    c = c + 1; %updates counter
    iter(c) = c; %stores counter vector
    yold = y; %temporarily stores last values
    xold = x; 
    y = (x^2 - y)/(5*x); %converges on 10 iter
    x = sqrt(x - y + .5); %converges on 10 iter
    xx(c) = x; %stores calculated solutions
    yy(c) = y;
    ex = abs((xx(c)-xold)/xx(c)); %calculates errors
    ey = abs((yy(c)-yold)/yy(c));
    eax(c) = ex * 100; %stores errors
    eay(c) = ey * 100;
end
A = [iter;xx;yy;eax;eay]; %matrix for table
fprintf('Iteration\t X\t\t   Y\t   Ea_X\t\t Ea_Y\n') %table formatting
fprintf('\t%d\t  %.5f\t%.5f\t  %.5f\t%.5f\n',A)
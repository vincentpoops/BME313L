clear all; close all; clc; %resets everything
A = [-5 3; 100 -301]; %coefficient matrix
[x,y] = eig(A); %solves for eigenvalues and eigenvectors
w = [50;100]; %given initial values
z = linsolve(x,w); %solves for constants
t = 0:.0001:1; %potential t values
v = z(1) * x(:,1) * exp(y(1)*t) + z(2) * x(:,2) * exp(y(4)*t); %general solution for t's
plot(t,v) %Plot
xlabel('t values') %labels
ylabel('Solution')
title('Plot of Solutions to a system of Homogeneous Linear Ordinary differential equations vs. t values')
fprintf('The eigenvalues of the matrix are:\n%f and %f\n',y(1),y(4)) %displays results
fprintf('The corresponding eigenvectors are:\n')
fprintf('%f       %f\n',x(1),x(3))
fprintf('%f  and   %f\nrespectively.\n',x(2),x(4))
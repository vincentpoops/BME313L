clear all; close all; clc; %resets everything
k = .69315/28.8; %rate constant
A = [-(.0056+k) 0 0 0 0;0 -(.01+k) 0 0 0;.01902 .01387 -(.047+k) 0 0;0 0 .33597 -(.376+k) 0; 0 0 0 .11364 -(.133+k)]; %coefficient matrix
[x,y] = eig(A); %solves for eigenvalues and eigenvectors
v = [17.7;30.5;43.9;136.3;30.1]; %initial cconditions
z = linsolve(x,v); %solves for constants
t = 1963:2011; %years vector
c = z(1) * x(:,1) * exp(y(1,1)*(t-1963)) + z(2) * x(:,2) * exp(y(2,2)*(t-1963)) + z(3) * x(:,3) * exp(y(3,3)*(t-1963)) + z(4) * x(:,4) * exp(y(4,4)*(t-1963)) + z(5) * x(:,5) * exp(y(5,5)*(t-1963)); %general solution
plot(t,c) %plot
axis([1963 2011 0 140]) %aesthetics
xlabel('Year') %labels
ylabel('Concentration of Strontium-90 (Bq/m^3)')
title('Concentration of Strontium pollutant in the North American Great Lakes')
legend('Lake Superior','Lake Michigan','Lake Huron','Lake Erie','Lake Ontario')
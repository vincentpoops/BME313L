clear all; close all; clc; %resets everything
A = [100 125 125 62.5;80 110 120 25;140 80 120 100;90 104.8 60 137.33]; %coefficient matrix
b = [6625;5290;7300;6539]; %right hand vector
n = length(A); %sets length, number can be used to designate end of matrix
ea = 1; %intialize error
nn = 0; %initializes counter
xi = [2;7;30;30]; %initial values
C = A; %duplicates matrix
while max(ea) > .08
    nn = nn + 1; %updates counter
    iter(nn) = nn; %vector for counter
    for i = 1:n
        C(i,i) = 0; %makes diagonals 0
    end
    for i = 1:n
        d = C(i,:); %works by row
        oldxi(i) = xi(i); %save old xi
        xi(i) = (b(i) - d*xi)/A(i,i); %Gauss-Seidal Method (updates as it goes)
        ea(i) = abs((xi(i) - oldxi(i))/xi(i)); %calculates error
    end
    y(nn) = xi(1); %saves values for each iteration
    w(nn) = xi(2);
    xx(nn) = xi(3);
    z(nn) = xi(4);
end
T = [iter;y;w;xx;z]; %matrix for table
fprintf('Iteration\t  y\t\t  w\t\t  x\t\t  z\n') %table formatting
fprintf('\t%d\t\t%.3f\t%.3f\t%.3f\t%.3f\n',T)
clear all; close all; clc; %resets everything
A = [11300 8150 4500 4000;5000 7500 3650 4200;1900 3900 3000 4800;1500 1400 2000 4850]; %coefficients matrix
b = [.6320;.5345;.3310;.196]; %right side of equal sign (A_i)
x = GaussPivot_VL(A,b); %calls Gauss elimination function with pivoting
fprintf('The concentrations for the Amino Acids M, N, O, and P are\n') %formatting
fprintf('%f, %f, %f, and %f, respectively.\n',x(1),x(2),x(3),x(4))
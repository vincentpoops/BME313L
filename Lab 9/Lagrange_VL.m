function yint = Lagrange_VL(x,y,xx)
% Lagrange: Lagrange interpolating polynomial
% yint = Lagrange(x,y,xx): Uses an (n - 1)-order
% Lagrange interpolating polynomial based on n data points
% to determine a value of the dependent variable (yint) at
% a given value of the independent variable, xx.
% input:
% x = independent variable
% y = dependent variable
% xx = value of independent variable at which the
% interpolation is calculated
% output:
% yint = interpolated value of dependent variable
n = length(x); %number of terms
if length(y)~=n, error('x and y must be same length'); end
s = 0; %initializes sums
for i = 1:n
    product = y(i); %loads current y
    for j = 1:n
        if i ~= j
            product = product*(xx-x(j))/(x(i)-x(j)); %lagrange interpolations
        end
    end
    s = s+product; %sums interpolations
end
yint = s; %outputs results
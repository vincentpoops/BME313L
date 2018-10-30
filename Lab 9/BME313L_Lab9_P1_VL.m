format long %makes it so you can tell small differences
x = [1.8;2.0;2.2;2.4;2.6]; %given data
y = [.5815;.5767;.5560;.5202;.4708];
a = polyfit(x(1:4),y(1:4),3); %3rd order polynomial fit
b = polyfit(x,y,4); %4th order polynomial fit
j3 = polyval(a,2.1); %calculates 3rd order at 2.1
j4 = polyval(b,2.1); %calculates 4th order at 2.1
bt = besselj(1,2.1); %calculates besselj at 2.1
error3 = abs(((bt-j3)/bt))*100; %calculates errors
error4 = abs(((bt-j4)/bt))*100; %calculates errors
xl = linspace(-2.6,2.6,50); %generates potential x's
p3 = polyval(a,xl); %3rd order polynomial
p4 = polyval(b,xl); %4th order polynomial
bj = besselj(1,xl); %besselj function
fprintf('The estimated Bessel value at 2.1 using a 3rd order polynomial is:\n%f\n',j3) %displays results
fprintf('The estimated Bessel value at 2.1 using a 4th order polynomial is:\n%f\n',j4)
fprintf('The true value of the Bessel function at 2.1 is:\n%f\n',bt)
fprintf('The percent relative error for a 3rd order interpolating polynomial is:\n%f%%\n',error3)
fprintf('The percent relative error for a 4th order interpolating polynomial is:\n%f%%\n',error4)
plot(xl,bj,xl,p3,xl,p4) %plot
legend('Bessel function','3rd Order Approximation','4th Order Approximation') %formatting
xlabel('x')
ylabel('J_1(x) values')
title('Polynomial Approximations of Bessel function of First Kind')
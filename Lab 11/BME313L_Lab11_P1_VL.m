x = -2.1:.1:2.1; %2 additional data points +1 on either end
y = 1/sqrt(2*pi)*exp(-x.^2/2); %function
d = diff(y)./diff(x); %first derivative
x = -2.05:.1:2.05; %inbetween x values
d2 = diff(d)./diff(x); %2nd derivative
x = -2:.1:2; %inbetween x values, desired range
plot(x,d2,'b') %plots x = -2: .1: 2 to corresponding d2y/d2x values
x_infl(1) = fzero(@(T) interp1(x,d2,T,'linear','extrap'),-1); %finds zero
x_infl(2) = fzero(@(T) interp1(x,d2,T,'linear','extrap'),1);
hold on %keeps plot
grid on %turns on grid
plot(x_infl,0,'ro') %plots zero
xlabel('x values') %labels
ylabel('d^2y/d^2x')
title('2nd Derivative Values of a Function')
fprintf('The x values where the 2nd derivative is 0 are:\n') %display values
fprintf('%f and %f\n',x_infl(1),x_infl(2))
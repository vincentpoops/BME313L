t = 0:1/16:100; %generates values of t
x = sin(t) .* (exp(cos(t)) - 2 * cos(4 * t) - (sin(t/12)).^5); %given parametric equations
y = cos(t) .* (exp(cos(t)) - 2 * cos(4 * t) - (sin(t/12)).^5);
subplot(2,1,1) %sets subplot location
plot(t,x,t,y,'--') %makes graph
xlabel('t values') %graph labels
ylabel('x and y values')
title('Graph of x and y versus t')
legend('x','y')
subplot(2,1,2) %sets 2nd subplot location
plot(x,y) %makes second graph
axis square %makes graph a square
xlabel('x values') %graph labels
ylabel('y values')
title('Graph of y versus x')
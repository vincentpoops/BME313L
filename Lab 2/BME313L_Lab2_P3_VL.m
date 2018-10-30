x = (-2:.25:2); %makes vector
h = .25;
f = 3 * (x) .^3 - 2 * (x) + 6; %original function
fprev = 3 * (x-1) .^3 - 2 * (x-1) + 6; %function with values x-1
fnext = 3 * (x+1) .^3 - 2 * (x+1) + 6; %function with values x+1
theoretical = 9 * x .^2 - 2; %theoretical change in x (derivative)
forward = ((3 * ((x+h) .^ 3) - 2 * (x+h) + 6) - (3 * x .^ 3 - 2 * x + 6))/h; %forward difference
backward = ((3 * x .^ 3 - 2 * x + 6) - (3 * (x-h) .^ 3 - 2 * (x-h) + 6))/h; %backward difference
centered = ((3 * (x+.5*h) .^ 3 - 2 * (x+.5*h) + 6) - (3 * (x-.5*h) .^ 3 - 2 *(x-.5*h) + 6))/h; %centered difference
eback = (theoretical - backward)./theoretical; %calculated errors
ecent = (theoretical - centered)./theoretical;
eforw = (theoretical - forward)./theoretical;
A =[x;f;fprev;fnext;theoretical;backward;eback;centered;ecent;forward;eforw]; %creates matrix of all values
fprintf('x\t    f(x)\t   f(x-1)\t     f(x+1)\t   f''(x)theory\t f''(x)back   Eback(%%)    f''(x)cent   Ecent(%%)    f''(x)forw   Eforw(%%)\n'); %outputs table
fprintf('%+.2f   %+.3f\t   %+f   %+f\t%+f\t %+f\t %+f\t %+f\t %+f\t %+f\t %+f\n',A);
plot(x,theoretical,'k',x,backward,':b',x,centered,'-.g',x,forward,'--r','LineWidth',2); %plots
xlabel('x') %axis labels
ylabel('y')
legend('theoretical','backward approximation','centered approximation','forward approximation');
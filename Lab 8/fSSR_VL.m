function f = fSSR_VL(a,t,d2) %function
dp = 2*a(1)^2.*(a(2).*t-a(2)^2*(1-exp(-t./a(2)))); %predicted values
f = sum((d2-dp).^2); %summation of squared residuals
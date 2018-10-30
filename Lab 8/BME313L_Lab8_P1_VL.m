c = [.5;.8;1.5;2.5;4]; %observed c values
k = [1.1;2.5;5.3;7.6;8.9]; %observed k values
x = 1./c.^2; %linearization for x
y = 1 ./ k; %linearization for x
n = length(x); %number of terms
sc = sum(x); sk = sum(y); %sums up x and y's
sc2 = sum(x.*x); sck = sum(x.*y); sk2 = sum(y.*y); %'squares'
a(1) = (n*sck-sc*sk)/(n*sc2-sc^2); %calculations using least squares
a(2) = sk/n-a(1)*sc/n;
kmax = 1/a(2); %calculates kmax
cs = a(1)/a(2); %calculates cs
kp = kmax.*c.^2./(cs+c.^2); %predicted values
fprintf('The estimated values of cs and kmax are\n') %formatting
fprintf('%f and %f, respectively\n',cs,kmax)
plot(c,k,'o',c,kp,'.-')
legend('Observed Growth Rates','Predicted Growth Rates')
xlabel('Oxygen Concentration (mg/L)')
ylabel('Growth Rate (per d)')
title('Growth Rate of Bacteria as a Function of Oxygen Concentraion')
grid on
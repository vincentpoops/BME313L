Kw = [1.164e-15;2.950e-15;6.846e-15;1.467e-14;2.929e-14]; %Observed Ion Product, Kw
Ta = [1;10;20;30;40]; %Observed Temperatures, Ta
y = -log(Kw); %linearizes--sort of
z = [Ta.^-1 log(Ta) Ta ones(size(Ta))]; %basis functions
a = (z'*z)\(z'*y); %general linear least squares regression
Kwp = (exp(a(1)./Ta+a(2)*log(Ta)+a(3).*Ta+a(4))).^-1; %predicted values of ion product, Kw
plot(Ta,Kw,'o',Ta,Kwp,'.-') %1st plot
xlabel('Absolute Temperature (K)') %1st plot formatting
ylabel('K_w')
title('Ion Product of Water as a Function of Temperature')
Sr = (Kw-Kwp).^2; %residual squared
figure %new figure
plot(Ta,Sr) %2nd plot
xlabel('Absolute Temperature (K)') %2nd plot formatting
ylabel('Squared Residual')
title('Squared Residual with respect to Temperature')
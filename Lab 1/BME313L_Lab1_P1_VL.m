T_F = 32:3.6:93.2; %creates a vector of temperatures
T_C = 5 / 9 * (T_F - 32); %Converts the temperature
Density = (5.5289e-8 * T_C.^3) - (8.5016e-6 * T_C.^2) + (6.5622e-5 * T_C) + 0.99987; %Computes the density based on the temperatures
plot(T_C,Density); %plots the graph
xlabel('Temperature (°C)'); %graph labels
ylabel('Density');
title('Density of Freshwater with Respect to Temperature');

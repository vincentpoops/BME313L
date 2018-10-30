x = [0;.375;.75;1.125;1.5;1.875;2.25;2.625;3]; %data
y = [0;-.2571;-.9484;-1.9689;-3.2262;-4.6414;-6.1503;-7.7051;-9.275]./100;
E = 200e9;
I = .0003;
n = length(x); %number of terms
%t = thetas
for i = 2:n-1 %only works with points on both sides
   t(i) = (y(i+1)-y(i-1))/(2*.375); %centered finite difference
end
t(1) = (-y(1+2)+4*y(1+1)-3*y(1))/(2*.375);
t(n) = (3*(y(n))-4*(y(n-1))+y(n-2))/(2*.375);
%M = moments
for i = 2:n-1 %only works with points on both sides
   M(i) = (t(i+1)-t(i-1))/(2*.375); %centered finite difference
end
M(1) = (-t(1+2)+4*t(1+1)-3*t(1))/(2*.375); 
M(n) = (3*(t(n))-4*(t(n-1))+t(n-2))/(2*.375);
M = M*E*I; %dt/dx = M/(EI)
%v = shear
for i = 2:n-1 %only works with points on both sides
   V(i) = (M(i+1)-M(i-1))/(2*.375); %centered finite difference
end
V(1) = (-M(1+2)+4*M(1+1)-3*M(1))/(2*.375);
V(n) = (3*(M(n))-4*(M(n-1))+M(n-2))/(2*.375);
%w = distributed load
for i = 2:n-1 %only works with points on both sides
   w(i) = (V(i+1)-V(i-1))/(2*.375); %centered finite difference
end
w(1) = (-V(1+2)+4*V(1+1)-3*V(1))/(2*.375);
w(n) = (3*(V(n))-4*(V(n-1))+V(n-2))/(2*.375);
w=-w; %dV/dx = -w

A = [x';y';t;M;V;w]; %compiles arrays
fprintf('  x\t\t\ty\t\t Theta(x)\t\t  M(x)\t\t\t  V(x)\t\t\t  w(x)\n') %outputs table
fprintf('%1.3f\t%+f\t%f\t%f\t  %f\t  %f\n',A)

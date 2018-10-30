function a = MySimpsons_VL(x,y)
n = length(x); %number of terms
if length(y)~=n, error('x and y must be same length'); end
w = 0; %initializes summation values
v = 0;
for i = 2:2:n-1 %summation of even index values
    w = w + y(i);
end
for i = 3:2:n-2 %summation of odd index values
    v = v + y(i);
end
a = (x(n)-x(1)) * (y(1)+4*w+2*v+y(n))/(3*(n-1)); %composite simpson's 1/3 rule
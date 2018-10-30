t = 3*60; %parameters, units fixed
ds = 4.3e-3/100^2; 
S = 20e-6;
f =@(P) (2 .* S.^2 * (P .* t - P.^2 .* (1 - exp(-t./P)))-ds); %equation
fplot(f,[0 5]) %graph to find root
[root,fx,ea,iter] = bisect(f,2,4,.0001,23); %calls function
P = root %outputs
n = iter
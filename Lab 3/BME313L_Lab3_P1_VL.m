z = .001:.01:.1; %creates vector
DT = 9e-6; %given parameters
V = .006;
rc = .0005;
tm = 5e-5;
K0 = 5.75e-5;
C0 = 6;
R0 = .01;
for i = 1:length(z) %loop for values of z
    f=@(y,z) ((y .^2 * log(y .^2))  - (y .^2) + 1 - (4*DT*C0/(R0*((rc+tm)^2))) + ((4*DT)*(y .^2 - 1)*z)/ (V*(rc^2)) + (((2*DT)*(y .^2 - 1))/ (rc * K0))); %function
    [root,fx,ea] = bisect(f,4.9,10.5,.0001,50,z(i)); %outputs and parameters for bisect
    rcrit = root .* (rc + tm); %calculates rcrit
    rCrit(i) = rcrit; %creates vector
    error(i) = ea; %creates vector
end
[hAx,hLine1,hLine2] = plotyy(z,rCrit,z,error); %plots graph
hLine2.LineStyle = '--'; %makes dotted line
ylabel(hAx(1),'rCrit') %left axis
ylabel(hAx(2),'Approximate Error') %right axis
xlabel('z')
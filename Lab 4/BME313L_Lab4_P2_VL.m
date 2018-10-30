delta = .05; %given pertubation
eff = 0.3:.1:.6; %efficiency values
fprintf('Efficiency Value\tIteration \t  xi+1 \t\t\txi+del_xi \t  f(xi) \t      f(xi+del_xi) \t    |Ea|\n') %table column
for z = 1:length(eff) %vector with same length as eff
    n = 0; %intialize counter
    x = 1; %initial guess
    e = 1; %intializes/reintializes error
    while e > .0003 %loop for conditional (error)
        n = n + 1; %counter
        EfficiencyValue(n) = eff(z); %efficiency value used in calculation
        f = 1/x*(1/tanh(3*x)-1/(3*x)) - eff(z); %function
        Iteration(n) = n; %iteration array
        xidelxi(n) = x + delta * x; %xi + delta*xi
        fxi(n) = f; %stores value of function
        fxidelxi(n) = 1/(xidelxi(n))*(1/tanh(3*(xidelxi(n)))-1/(3*(xidelxi(n)))) - eff(z); %function with pertubation
        nextxi(n) = x - delta*x*fxi(n)/(fxidelxi(n)-fxi(n)); %calculates next guess
        e = abs((nextxi(n)-x)/nextxi(n)); %calculates error
        Ea(n) = e*100; %error array
        x = nextxi(n); %updates guess
    end
    A = [EfficiencyValue;Iteration;nextxi;xidelxi;fxi;fxidelxi;Ea]; %matrix for table
    fprintf('   \t%1.1d \t\t\t%d  \t\t  %f\t\t%f\t  %+f \t  %+f \t\t%+f\n',A) %print columns
    fprintf('\n') %print space between efficiency values
    root(z) = nextxi(n); %creates a vector of calculated roots
    EfficiencyValue = 0; %resets arrays to be used
    Iteration = 0;
    nextxi = 0;
    xidelxi =  0;
    fxi = 0;
    fxidelxi = 0;
    Ea = 0;
end
plot(root,eff) %plots roots against efficiency values
xlabel('Roots') %makes plot understandable
ylabel('Efficiency Value')
function [x,f,ea,iter]=newtmult_VL(func,x0,es,maxit,varargin)
% newtmult: Newton-Raphson root zeroes nonlinear systems
% [x,f,ea,iter]=newtmult(func,x0,es,maxit,p1,p2,...):
% uses the Newton-Raphson method to find the roots of
% a system of nonlinear equations
% input:
% func = name of function that returns f and J
% x0 = initial guess
% es = desired percent relative error (default = 0.0001%)
% maxit = maximum allowable iterations (default = 50)
% p1,p2,... = additional parameters used by function
% output:
% x = vector of roots
% f = vector of functions evaluated at roots
% ea = approximate percent relative error (%)
% iter = number of iterations
if nargin<2,error('at least 2 input arguments required'),end
if nargin<3||isempty(es),es=0.0001;end %defaults error criterion if not included
if nargin<4||isempty(maxit),maxit=50;end %defaults max iteration if not included

iter = 0; %initializes counter
x=x0; %initializes guess
while (1)
    [J,f]=func(x,varargin{:}); %plugs arguments into
    dx=(J\f)';
    x=x-dx; %calculates next x and automatically replaces it
    iter = iter + 1; %updates counter
    ea=100*max(abs(dx./x)); %calculates error

    if iter>=maxit||ea<=es, break, end %breaks on either reaching max iterations or if error criterion is reached
end
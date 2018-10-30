function [q,Error,iter] = romberg_VL(func,a,b,es,maxit,varargin)
% romberg: Romberg integration quadrature
% q = romberg(func,a,b,es,maxit,p1,p2,...):
% Romberg integration.
% input:
% func = name of function to be integrated
% a, b = integration limits
% es = desired relative error (default = 0.000001%)
% maxit = maximum allowable iterations (default = 30)
% pl,p2,... = additional parameters used by func
% output:
% q = integral estimate
% ea = approximate relative error (%)
% iter = number of iterations
if nargin<3,error('at least 3 input arguments required'),end
if nargin<4||isempty(es), es=0.000001; end %default values
if nargin<5||isempty(maxit), maxit=50; end
n = 1; %initializes number of segments
I(1,1) = trap_VL(func,a,b,n,varargin{:}); %simple trapezoid, first value
iter = 0; %iteration counter
while iter<maxit
iter = iter+1; %update iteration coutner
n = 2^iter; %updates segments
I(iter+1,1) = trap_VL(func,a,b,n,varargin{:}); %Adds another O(h^2) value from richardson extrapolation
for k = 2:iter+1 %column position counter
j = 2+iter-k; %row position coutner
I(j,k) = (4^(k-1)*I(j+1,k-1)-I(j,k-1))/(4^(k-1)-1); %romberg integration algorithm
end
ea = abs((I(1,iter+1)-I(2,iter))/I(1,iter+1))*100; %calculates percent approximate error
Error(iter) = ea; %stores error
if ea<=es, break; end %error criterion
end
q = I; %final result
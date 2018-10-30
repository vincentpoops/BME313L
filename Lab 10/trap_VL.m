function I = trap_VL(func,a,b,n,varargin)
% trap: composite trapezoidal rule quadrature
% I = trap(func,a,b,n,pl,p2,...):
% composite trapezoidal rule
% input:
% func = name of function to be integrated
% a, b = integration limits
% n = number of segments (default = 100)
% pl,p2,... = additional parameters used by func
% output:
% I = integral estimate
if nargin<3,error('at least 3 input arguments required'),end 
if ~(b>a),error('upper bound must be greater than lower'),end %bounds must be from low to high
if nargin<4|isempty(n),n=100;end %default values
x = a; h = (b - a)/n; %initializes 'x', h is the spacing between segments
s=func(a,varargin{:}); %plugs lower limit in
for i = 1 : n-1
x = x + h; %next segment
s = s + 2*func(x,varargin{:}); %weighted 2x every value except lower and upper limits
end
s = s + func(b,varargin{:}); %adds upper limit
I = (b - a) * s/(2*n); %height x length (trapezoid) for area
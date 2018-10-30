function x = Tridiag_VL(e,f,g,r)
% Tridiag: Tridiagonal equation solver banded system
% x = Tridiag(e,f,g,r): Tridiagonal system solver.
% input:
% e = subdiagonal vector
% f = diagonal vector
% g = superdiagonal vector
% r = right hand side vector
% output:
% x = solution vector
n=length(f); %calculates dimensions of vector
% forward elimination
for k = 2:n  
factor = e(k)/f(k-1); %calculates scalar difference
f(k) = f(k) - factor*g(k-1); %updates diagonal vector
r(k) = r(k) - factor*r(k-1); %updates right hand side vector
end
% back substitution
x(n) = r(n)/f(n); %solves for last value
for k = n-1:-1:1
x(k) = (r(k)-g(k)*x(k+1))/f(k); %Plugs previous values to solve for current
end
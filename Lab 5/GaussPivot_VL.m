function x = GaussPivot_VL(A,b)
% GaussPivot: Gauss elimination pivoting
% x = GaussPivot(A,b): Gauss elimination with pivoting.
% input:
% A = coefficient matrix
% b = right hand side vector
% output:
% x = solution vector
[m,n]=size(A); 
if m~=n, error('Matrix A must be square'); end %rows must be equal to columns (need same number of equations as variables)
nb=n+1;
Aug=[A b]; %forms augmented matrix
% forward elimination
for k = 1:n-1
    
    % partial pivoting
    [~,i]=max(abs(Aug(k:n,k))); %finds the row with the highest value for the column the script is working with
    ipr=i+k-1; %finds aforementioned value relative to k, current row
    if ipr~=k
    Aug([k,ipr],:)=Aug([ipr,k],:); %if largest row is not current row, flips them
    end

    for i = k+1:n
    factor=Aug(i,k)/Aug(k,k); %calculates difference between rows
    Aug(i,k:nb)=Aug(i,k:nb)-factor*Aug(k,k:nb); %subtracts difference
    end
end

% back substitution
x=zeros(n,1); %creates zeroes vector
x(n)=Aug(n,nb)/Aug(n,n); %solves for last value, first
for i = n-1:-1:1
x(i)=(Aug(i,nb)-Aug(i,i+1:n)*x(i+1:n))/Aug(i,i); %plugs previous values in until all variables are solved.
end
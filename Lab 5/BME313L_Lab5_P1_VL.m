clear all; close all; clc; %resets everything
A = [0 2 5;2 1 1;3 1 0]; %associated constants
a = det(A); %takes determinant
B = [1;1;2]; %right side of system of equations
fprintf('The determinant of the system (A) is:\n') %formatting
fprintf('%g\n\n',a)

%cramer's rule
for i = 1:3
    A(:,i) = B; %replace column
    b(i) = det(A); %takes new determinant
    x(i) = b(i)/a; %cramer's rule
    A = [0 2 5;2 1 1;3 1 0]; %reset matrix
end
fprintf('Using Cramer''s rule: x_1, x_2, and x_3 are equal to \n') %formatting
fprintf('%g, %g, and %g (respectively)\n\n',x(1),x(2),x(3))

%gauss elimination
Aug = [A B]; %forms augmented matrix
for k = 1:2
    %partial pivoting portion
    [~,i]=max(abs(Aug(k:3,k))); %finds row with largest column
    ipr = i+k-1; %calculates largest row (relative to row working with)
    if ipr ~= k 
        Aug([k,ipr],:)= Aug([ipr,k],:); %switches rows (pivots) if current row is less
    end
        
    for i = k+1:3
        factor = Aug(i,k)/Aug(k,k); %figures out multiple to subtract one row from another
        Aug(i,k:4) = Aug(i,k:4) - factor * Aug(k,k:4); %subtracts one row from another
    end
end
x = zeros(3,1); %resets x
x(3) = Aug(3,4)/Aug(3,3); %solves for 3rd value of x
for i = 2:-1:1
    x(i) = (Aug(i,4) - Aug(i,i+1:3) * x(i+1:3))/Aug(i,i); %backwards substitution to solve for second and first values of x
end
fprintf('Using Gauss Elimination: x_1, x_2, and x_3 are equal to: \n') %formatting
fprintf('%g, %g, and %g (respectively)\n\n',x(1),x(2),x(3))

%plugs results back in
fprintf('When the result is plugged back into the equations, ')
Ax = int8(A * x);
if Ax == B %checks if result is the same.
    fprintf('the solution checks out\n')
else
    fprintf('the solution does not check out\n')
end
for i = 1:4
x = [3;5;2;6;1]; %rearranged data
y = [5.5;40;4;82;7];
a(i) = Newtint_VL(x(1:i+1),y(1:i+1),4); %calls newtint
b(i) = Lagrange_VL(x(1:i+1),y(1:i+1),4); %calls lagrange
end
fprintf('For both Newton and Lagrange, the values of order 1-4 are:\n') %output results
fprintf('1st\t\t2nd\t\t3rd\t\t4th\n')
fprintf('%1.2f\t',a)
fprintf('\n')
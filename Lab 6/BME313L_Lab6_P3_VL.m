clear all; close all; clc; %resets everything
[x,f,ea,iter] = newtmult_VL(@receptor_ligand_func_VL,[.5,.2],1,100); %calls receptor ligand function as an anonymous function into newmult
%initial guesses, error, and max iterations are built in.
fprintf('x_a:\n%f\nx_b:\n%f\n',x(1),x(2)) %output results
fprintf('approximate percent error at convergence:\n%f\n',ea)
fprintf('number of iterations for convergence:\n%d\n',iter)
clear all; close all; clc; %resets MATLAB
A = [2 8 10; 8 4 5; 10 5 7]; %coefficient matrix
%[x,y] = powereig_VL(A,5,50); %calls powereig function
es = .05; %error
n = length(A); 
evect = ones(n,1); %forms initial 'guess' for eigenvector
eval = 1; %initializes eigenvalue
ea = 1; %initializes error
while ea >= es
    evalold = eval; %stores last eigenvalue
    evect = A*evect; %calculated eigenvector
    eval = max(abs(evect)); %updates eigenvalue
    evect = evect./eval; %new eigenvector
    if eval~=0
        ea = abs((eval-evalold)/eval); %calculates error
    end   
end
fprintf('The highest eigenvalue for the matrix is:\n%f\n',eval) %displays results
fprintf('The corresponding eigenvector is:\n')
fprintf('%f\n',evect)
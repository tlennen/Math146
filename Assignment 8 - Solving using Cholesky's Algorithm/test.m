% Math 146 HW#8 by Tyler Lennen

% MATLAB Part of HW

A = [4 2 -6; 2 2 -5;-6 -5 14];
b=[1; 2; 3];
tic;
% Cholesky decomp and solve
R = my_chol(A)
x = my_cholsolve(R,b)
% The x value matches with the expected value of x and A was decomposed
% into the correct form.
toc;


tic;
[L,U,P]=ludecomp(A,3)
x = my_LUsolve(L,U,P,b)
toc;

% The Cholesky Method of solving the system is much faster when compared to
% the LU decomposition method. This can be seen clearly with how many flop
% counts are used to calculate both L and U matrices while the R matrices
% can represent A with R'*R. The average test time for LU decomp on my
% laptop is 0.0067 while cholsolve is much faster with 0.0035.
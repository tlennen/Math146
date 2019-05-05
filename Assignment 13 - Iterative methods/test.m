% Math 146 Homework 13 by Tyler Lennen
% Stage 1 is writing the methods for my_jacobi and my_gausssiedel which are
% attached.
% Below is the testing for them.

% A = [ 5 2 ; 3 4];
% b = [1;2];
% x0 =[0;0];
% tol = 10^(-5);
% maxiter = 30;
% real_answ = A\b
% % Test to see if working
% disp("Jacobi");
% [x,iter,relresid] = my_jacobi(A,b,x0,tol,maxiter)
% disp("Gauss Striedel");
% [x,iter,relresid] = my_gaussSeidel(A,b,x0,tol,maxiter)
% The answers converge and both methods work

% Part 2 of the assignment for a converging matrix
disp("Converging Matrix");
A = [19 4 5; 6 10 1; 0 3 6];
b = [12; 20 ;34];
x0=[0;0;0];
maxiter = 50;
tol = 10^(-10);

L = tril(A,-1)
U = triu(A,1)
D = diag(diag(A));
% NORMS OF JACOBI B MATRIX
B_J = inv(D)*(-L-U);
B_J_1 = norm(B_J,1)
B_J_2 = norm(B_J,2)
B_J_inf = norm(B_J,inf)
B_J_p = max(abs(eig(B_J)))

% NORMS OF GAUSS STRIEDEL B MATRIX
B_GS = inv(D+L)*(-U);
B_GS_1 = norm(B_GS,1)
B_GS_2 = norm(B_GS,2)
B_GS_inf = norm(B_GS,inf)
B_GS_p = max(abs(eig(B_GS)))

real_answ = A\b
disp("Jacobi");
[x1,iter1,relresid1] = my_jacobi(A,b,x0,tol,maxiter)
disp("Gauss Striedel");
[x2,iter2,relresid2] = my_gaussSeidel(A,b,x0,tol,maxiter)

% Plots are in the functions. The data confirms that Gauss Striedel
% converges faster than Jacobi. The spectral radius is the smallest of the
% values and it is less than one for both.

% Part 3 of the assignment for a diverging matrix
disp("Diverging Matrix");
A = [1 4 5; 6 1 1; 1 3 2];
b = [12; 20 ;34];
x0=[0;0;0];

L = tril(A,-1)
U = triu(A,1)
D = diag(diag(A));
% NORMS OF JACOBI B MATRIX
B_J = inv(D)*(-L-U);
B_J_1 = norm(B_J,1)
B_J_2 = norm(B_J,2)
B_J_inf = norm(B_J,inf)
B_J_p = max(abs(eig(B_J)))

% NORMS OF GAUSS STRIEDEL B MATRIX
B_GS = inv(D+L)*(-U);
B_GS_1 = norm(B_GS,1)
B_GS_2 = norm(B_GS,2)
B_GS_inf = norm(B_GS,inf)
B_GS_p = max(abs(eig(B_GS)))

maxiter = 20;
tol = 10^(-10);
real_answ = A\b
disp("Jacobi");
[x1,iter1,relresid1] = my_jacobi(A,b,x0,tol,maxiter)
disp("Gauss Striedel");
[x2,iter2,relresid2] = my_gaussSeidel(A,b,x0,tol,maxiter)

% The diverging matrix has norms and spectral radius all above 1 and the
% values of both Gauss striedel and Jacobi increase each iteration.

% Extra credit
% A matrix that works for Gauss but not Jacobi
disp("Extra credit");
A = [1 1;1 1];
b = [1;1];
x0=[0;0];

L = tril(A,-1)
U = triu(A,1)
D = diag(diag(A));
% NORMS OF JACOBI B MATRIX
B_J = inv(D)*(-L-U);
B_J_1 = norm(B_J,1)
B_J_2 = norm(B_J,2)
B_J_inf = norm(B_J,inf)
B_J_p = max(abs(eig(B_J)))

% NORMS OF GAUSS STRIEDEL B MATRIX
B_GS = inv(D+L)*(-U);
B_GS_1 = norm(B_GS,1)
B_GS_2 = norm(B_GS,2)
B_GS_inf = norm(B_GS,inf)
B_GS_p = max(abs(eig(B_GS)))

maxiter = 50;
tol = 10^(-10);
real_answ = A\b
disp("Jacobi");
[x1,iter1,relresid1] = my_jacobi(A,b,x0,tol,maxiter)
disp("Gauss Striedel");
[x2,iter2,relresid2] = my_gaussSeidel(A,b,x0,tol,maxiter)

% The matrix [1 1;1 1] only works for gauss striedel because Jacobi does
% not update the x vectors and is therefore stuck at a large error. Gauss
% striedel gets it in one iteration.

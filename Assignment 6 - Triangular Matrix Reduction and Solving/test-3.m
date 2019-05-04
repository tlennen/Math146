% Math 146 HW7 test script by Tyler Lennen
% Pen and Paper section
A = [16 4 4 -4;4 10 4 2;4 4 6 -2; -4 2 -2 4];
chol(A);

% Coding section

% 1a) before coding
% We only need Lsub and Udiag because the resulting LU decomposition will
% only have values along the diagonal of U and sub diagonal of L. This is
% due to a tri-diagonal matrix being reduced to that state. The resulting
% matrix will not have a changed super-diagonal so we do not need that
% information. The diagonal of L would just be all ones as well, so that is
% not needed either.

n = 4;
a = ones(n-1,1);
b = ones(n,1)*2;
c = ones(n-1,1);
% Above is a 4x4 matrix with 2s on diagonal and ones on the sub and super
% diagonal.

[Lsub,Udiag] = mytriLU(a,b,c,n);
U = diag(Udiag)+diag(c,1);
L = diag(Lsub,-1)+eye(n)
L*U % Results in the original matrix

% 1b) Flop count of the funciton is as follows. I am ignoring the initial
% adding of recreating U as I am sure you can run the algorithm without
% that but I did that to make it easier to implement. The main loop runs n-1
% times, and inside are 7 flops, which I have labeled in the original code.
% Therefore, the flop count is 7n-7 or O(n), which is really good.


% 2a) Before coding
% The solution vector x is computed by solving the system like a regular LU
% system, but with less iterations. LUx = b so we can say Ux=y and Ly=b and
% find the values of x. The L will be forward sub and the U will be
% backward sub and that is how it will be solved.
rhs = [1:n]; % 1 to 4
x = mytriSolve(Lsub,Udiag,c,rhs,n)
A = diag(a,-1)+diag(b)+diag(c,1);
true_x = linsolve(A,rhs')
% The true x vector and the calculated x vector match, therefore the
% trisolve funciton works.

% 2b) The flop count of trisolve is the following. I am again ignoring the
% additions to create the matrices. The flop counts are labeled in the
% funciton. There are two loops of size n-1. The total flop count is 5n-4
% flops or a O(n) function. That means that the total process of both
% functions is still an O(n) and is much more effecient than our previous
% methods.


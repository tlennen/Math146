% This test file is used to test the functions of this homework.
% Tyler Lennen

% Test for my_Fsolve()
A = [3  0   0;  2   3   0;  4   2   3];
b=[3;4;5];
forwardsub = my_Fsolve(A,b)
% The correct answer is [1,.666, -.1111]. This matches with the function
% output, therefore my_Fsolve works.

% Test for my_Bsolve()
A = [1 2 3;0 4 5; 0 0 6];
b = [3;4;5];
backsub = my_Bsolve(A,b)
% The correct answer is [0.5833,-0.417,.8333]. This matches with the function
% output, therefore my_Bsolve works.

%Test for my_LUdecomp
A=[3 3 3;2 5 4; 2 6 8];
[L,U] = my_LUdecomp(A);
% if L*U = A, then the function works
L*U
% This multiplication results in A, which means that the function works.

%Test for my_LUsolve
b = [3;2;1];
A=[3 3 3;2 5 4; 2 6 8];
% The x vector should be [1.1,0.2,-0.3]
x = my_LUsolve(A,b)
% The x vector is the expected value, so it is correct
% We can also text if A*x = b
A*x
% And that is also correct



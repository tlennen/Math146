% This is a test script for HW3 Tyler Lennen

A = [1 2 3;3 2 4; 5 6 2];
B = ludecomp(A,3);
tic
invA = my_inv(A)
toc
inv(A)
% These two match up so it works.
% A = [1 2 3 4 5; 1 7 2 9 2; 9 7 5 9 5; 2 4 6 4 9; 1 4 2 4 5];
% tic
% invA = my_inv(A);
% toc
% Time is much greater when A is 5x5 vs 3x3
% Tyler Lennen
% The my_LUsolve function takes in a square matrix and b vector, and solves
% the Ax=b equation using LU decomposition. A and b must be in n dimension.
function x = my_LUsolve(A,b)
    [L,U]=my_LUdecomp(A);
    y = my_Fsolve(L,b);
    x = my_Bsolve(U,y);
end
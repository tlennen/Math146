% Math 146 HW6 by Tyler Lennen
% The purpose of this function is to calculate the LU decomposition of a
% tridiagonal matrix and only return the vectors that are necessary. For
% the answers of the homework, look to the test file.
function [Lsub,Udiag] = mytriLU(a,b,c,n)
    U = diag(a,-1)+diag(b)+diag(c,1);
    L = zeros(n,n);
    for i=2:n
        L(i,i-1) = U(i,i-1)/U(i-1,i-1); % 1 flop
        U(i,i-1:i)=U(i,i-1:i)-U(i-1,i-1:i)*L(i,i-1); % 2+2+2 = 6 flops
    end
    Udiag = diag(U);
    Lsub = diag(L,-1);
end
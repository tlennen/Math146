% Tyler Lennen
% The my_LUdecomp function takes in a square matrix and outputs a lower and
% upper triangular decompisition. Used slides as reference.
function [L,U] = my_LUdecomp(A)
    N=size(A,1);
    L = zeros(N,N);
    U = zeros(N,N);
    for i=1:N-1 %pivot
        for j=i+1:N
            if A(i,i)==0
                error("Pivot is zero");
            end
            A(j,i)=A(j,i)/A(i,i);
            for k=i+1:N
                A(j,k)=A(j,k)-A(j,i)*A(i,k);
            end
        end
    end
    U = triu(A);
    L=tril(A,-1)+eye(N);
end
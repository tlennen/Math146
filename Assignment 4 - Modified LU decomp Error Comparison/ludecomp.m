function [L, U, P, p] = ludecomp(A,n)
    L = eye(n);P = eye(n);
    p = max(max(abs(A)));
    gfac = 0;
    if det(A)==0
        error("This is a singular matrix");
    end
    for i = 1:n-1
        
        gfac = max(gfac,max(max(abs(A)))); % max between old gfac and new
        
        %%% task1 %%%
        % This task finds the max value in pivots and the position
        % The command would be at i =1, [val, pos] = max(abs(A(1:n, 1)));
        [val, pos] = max(abs(A(i:n, i))); % finds max value in pivots
        pivotindex = pos + i - 1;
        %%% task2 %%%
        % This task switches the rows of the pivot 
        % The command for i =1 would be just all the is replaced
        if pivotindex ~= i
            tmp = A(i, i:n);
            A(i, i:n) = A(pivotindex, i:n);
            A(pivotindex, i:n) = tmp;
            tmp = P(i, 1:n);
            P(i, 1:n) = P(pivotindex, 1:n);P(pivotindex, 1:n) = tmp;
            tmp = L(i, 1:i-1);L(i, 1:i-1) = L(pivotindex, 1:i-1);
            L(pivotindex, 1:i-1) = tmp;
        end
        %%% task3 %%%
        % This task finds the factor that will be used to divide the pivot
        % row. That is then saved in L.
        % Just replace i with 1 to have the command
        factors = A(i+1:n,i)/A(i,i);
        L(i+1:n,i) = factors;
        %%% task4 %%%
        % This task removes the factors from the upper matrix and replaces
        % it with zeros. Just replace i with 1 to have the command
        A(i+1:n, i+1:n) = A(i+1:n, i+1:n) - factors*A(i, i+1:n);
        A(i+1:n,i) = zeros(n-i,1);
    end
    U = A;
    p=gfac/p;
end
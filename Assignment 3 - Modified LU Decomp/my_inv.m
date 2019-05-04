function invA = my_inv(A)
    if det(A)==0
        error("This is a singular matrix");
    end
    n= size(A,1);
    [L,U,P] = ludecomp(A,n);
    invA = inv(U)*inv(L)*inv(P);
    % Couldn't get it to work
    % I assumed that you wanted it by LU decomp but it would be much
    % simpler to just do the inverse calculation on A using Gaussian Elimination
    % because you need it for the inv(P) anyways. 
    inv(U);
    invU = eye(n);
    for i=n:-1:1
        invU(i-1:-1:1,i:end)=invU(i-1:-1:1,i:end)-U(i-1:-1:1,i)*invU(i,i);
        U(i-1:-1:1,i:end)=U(i-1:-1:1,i:end)-U(i-1:-1:1,i:end)*invU(i,i);
    end
    for i=1:n
        invU(i,:) = invU(i,:)/U(i,i);
        U(i,:)=U(i,:)/U(i,i);
    end
    invL = eye(n);
    for i=1:n
        invL(i+1:n,:)=invL(i+1:n,:)-invL(i,:)*L(i,i);
        L(i+1:n,:)=L(i+1:n,:)-L(i,:)*L(i,i);
    end
    L
    invL
    inv(L)
    invU;
    U;
end
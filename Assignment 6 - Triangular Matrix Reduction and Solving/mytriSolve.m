function x = mytriSolve(Lsub,Udiag,c,rhs,n)
    U = diag(Udiag)+diag(c,1)
    L = eye(n,n)+diag(Lsub,-1);
    y = zeros(n,1);
    x = zeros(n,1);
    y(1) = rhs(1);
    for i=2:n
        y(i) = rhs(i)-L(i,i-1)*y(i-1); % 2 flops for n-1 times
    end
    x(n) = y(n)/U(n,n); % 1 flop
    for i=n-1:-1:1
        x(i) = (y(i)-U(i,i+1)*x(i+1))/U(i,i); % 3 flops for n-1 times
    end
end
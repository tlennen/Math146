function x = my_LUsolve(L,U,P,b)
    n = size(U,1);
    x=zeros(n,1);
    y=zeros(n,1);
    b = P*b;
    y(1)=b(1)/L(1,1);
    %Forward substitution
    for i=2:n
        tot = b(i)-sum(L(i,i-1:-1:1).*y(i-1:-1:1)');
        y(i)=1/L(i,i)*tot;
    end
    % Backward substitution
    x(n)=y(n)/U(n,n);
    for i=n-1:-1:1
        tot = y(i)-sum(U(i,i+1:n).*x(i+1:n)');
        x(i)=1/U(i,i)*tot;
    end
end
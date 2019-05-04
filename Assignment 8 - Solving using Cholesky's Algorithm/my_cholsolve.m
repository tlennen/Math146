function x = my_cholsolve(R,b)
    L = R';
    n = size(R,1);
    x=zeros(n,1);
    y=zeros(n,1);
    y(1)=b(1)/L(1,1);
    %Forward substitution
    for i=2:n
        tot = b(i)-sum(L(i,i-1:-1:1).*y(i-1:-1:1)');
        y(i)=1/L(i,i)*tot;
    end
    % Backward substitution
    x(n)=y(n)/R(n,n);
    for i=n-1:-1:1
        tot = y(i)-sum(R(i,i+1:n).*x(i+1:n)');
        x(i)=1/R(i,i)*tot;
    end
end
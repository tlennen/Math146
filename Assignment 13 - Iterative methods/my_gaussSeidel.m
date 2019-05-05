function [x,iter,relresid] = my_gaussSeidel(A,b,x0,tol,maxiter)
    n=size(A,1);
    x=x0;
    iter = maxiter;
    rel_hist = zeros(maxiter);
    % Returns maxiter if fails
    for c = 1:maxiter
        for i=1:n % goes through every x value
            total =0;
            for j=1:n
                if(j~=i)
                    total=A(i,j)*x(j)+total; % Main calculation
                end
            end
            x(i) = (b(i)-total)/A(i,i);
        end
        relresid = norm(b-A*x)/norm(b);
        rel_hist(c)=relresid;
        if relresid<=tol % checks if resident residual is < tol
            iter = c;
            break;
            %end program and return relresid, x, and iterations
        end
    end
    figure;
    plot(1:iter,rel_hist(1:iter));
    title('Gauss-Streidel:Plot of iterations vs resident residual');
    set(gca, 'YScale', 'log')
    ylabel('Resident Residual');
    xlabel('Iterations');
end
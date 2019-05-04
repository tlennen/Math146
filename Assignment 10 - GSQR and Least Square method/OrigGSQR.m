function [Q,R] = OrigGSQR(A)
    % allocate the output matrices Q and R
    [m, n] = size(A);
    Q = zeros(m, n);
    R = zeros(n, n);
    % begin the computation
    for i=1:n
        Q(:,i) = A(:,i);
        % subtract projections onto previous unit vectors
        for j=1:i-1
            R(j,i) = Q(:,j)'*Q(:,i); % DOT PRODUCT
        end
        for j=1:i-1
            Q(:,i) = Q(:,i) - R(j,i)*Q(:,j);% subtraction
        end
        % normalize
        R(i,i) = norm(Q(:,i));
        Q(:,i) = Q(:,i)/R(i,i);
    end
end
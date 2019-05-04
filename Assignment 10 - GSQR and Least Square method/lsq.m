function p = lsq(t,y,n)
    rows = size(t,1);
    V = ones(rows,n+1);
    for i=1:size(V,1)
        for j=1:size(V,2)
            for k=2:j
                V(i,j) = t(i)*V(i,j);
            end
        end
    end
    b = V'*y
    A = V'*V
    p = A\b;
    % Just doing simple system solving because method was not specified.
end
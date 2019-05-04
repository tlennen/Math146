function R = my_chol(A)
    n=size(A,1);
    R = zeros(n,n);
    for i=1:n
        tot=0;
        for k=1:i-1
            tot = tot + R(k,i)^2;
        end
        tmp=A(i,i)-tot;
        if tmp<=0
            R = []; 
            disp("Error: Tmp less than or equal to 0");
            return;
        end
        R(i,i) = sqrt(tmp);
        for j=i+1:n
            tot = 0;
            for k=1:i-1
                tot = tot+R(k,i)*R(k,j);
            end
            R(i,j)= (A(i,j)-tot)/R(i,i);
        end
    end
end
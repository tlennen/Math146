function [e1,e2,e3,e4] = testGSQR(n)
    e1 = 0;
    e2 = 0;
    e3 = 0;
    e4 = 0;
    for i=1:n
        A = randi([-100,100], [50,50]);
        [Q1,R1] = ModGSQR(A);
        [Q2,R2] = OrigGSQR(A);
        e1 = e1 + norm(A-Q1*R1);
        e2 = e2 + norm(A-Q2*R2);
        e3 = e3 + norm(eye(50)-Q1'*Q1);
        e4 = e4 + norm(eye(50)-Q2'*Q2);
    end
    e1 = e1/n;
    e2 = e2/n;
    e3 = e3/n;
    e4 = e4/n;
end
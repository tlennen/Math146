% Math 146 HW 6 MATLAB Problem 1 by Tyler Lennen

% To keep things simple, the diagonal will be all 2s and sub/super will be
% 1s. Testing 10 to the power of 1, 2, and 3. Results will be written in
% the comments. N is the size of the matrix.

n = 1;
for i=1:4
    n=10*n
    rhs = 1:n;
    middle = 2*ones(n,1);
    sides = ones(n-1,1);
    A = diag(sides,1)+diag(middle)+diag(sides,-1);
    disp("A/rhs");
    tic;
    normal = A/rhs;
    toc;
    disp("Thomas");
    tic;
    output = thomas(sides,middle,sides,rhs,n);
    toc;
end

% So I ran the test for 10 from powers 1-4. I multiple times to make sure
% the patterns I had were consistent. On the run I am using as an example,
% at n=10, A/rhs time was faster and Thomas was slower in the runtime.
% However, this changed as n increased and the Thomas algorithm was
% multiple times better. At n=10000, A/rhs is 1.5 seconds while Thomas is
% 0.001. This has great scalability, as long as it is in the correct form,
% and it demonstrates its O(n) time.
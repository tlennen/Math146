% Math 146 HW4 by Tyler Lennen
%Part 1
A = [1 2 40; 3 4 5; 90 2 3];
[L,U,P,p] = ludecomp(A,3)

%Part 2

h1=single(6.62607004e-34);
h2=double(6.62607004e-34);

n = 0;
singleh1 = 1;
while singleh1~=0
    n=n+1;
    singleh1=singleh1*h1;
end
single_n = n
% With single precision, the h^n value underflows at n=3

n = 0;
doubleh2 = 1;
while doubleh2~=0
    n=n+1;
    doubleh2=doubleh2*h2;
end
double_n = n
% With double precision, the h^n value underflows at n=10

%Part 3
n=0;
sum = single(0);
while sum~=1
    n=n+1;
    sum=single(1);
    e = 10^-n;
    sum=sum+e;
end
m_epsilon = e
% My rough estimate of episolon is 10^-8
% I have a for loop above that adds episolon to one and checks if it is the
% same.

% Part 4
A = [1 2 3 4 5; 6 7 8 9 10; 11 12 13 14 15];

eig_norm = sqrt(max(eig(A'*A)))
two_norm = norm(A,2)
% The above statements result in the same value, therefore the 2-norm is
% equal to the square root of the max eigenvalue of A^T*A.

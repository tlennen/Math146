% Tyler Lennen
% The my_Bsolve function uses backward substition to solve a linear system
% The requirements for this function are that A and b must be of the N
% dimension, A is a square, nonsingular, upper trianglular matrix. The output 
% is the solution to the system, vector x.
function x = my_Bsolve(A,b)
    N=size(A,1);
    x = zeros(N,1);
    for i=N:-1:1
        tot = b(i);
        for j=i+1:N
            tot = tot-A(i,j)*x(j);
        end
        x(i)=tot/A(i,i);
    end
end
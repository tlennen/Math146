% Tyler Lennen
% The my_Fsolve function uses forward substition to solve a linear system
% The requirements for this function are that A and b must be of the N
% dimension, A is a square, nonsingular, lower trianglular matrix. The output 
% is the solution to the system, vector x.
function x = my_Fsolve(A,b)
    N=size(A,1);
    x = zeros(N,1);
    for i=1:N
        tot = b(i);
        for j=1:i-1
            tot = tot-A(i,j)*x(j);
        end
        x(i)=tot/A(i,i);
    end
end
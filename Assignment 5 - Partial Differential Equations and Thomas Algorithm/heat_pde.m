% Math 146 HW 6 MATLAB Problem 2 by Tyler Lennen
% Solving the heat equation and graphing it.

f = @(x) -3*(x-1/3).^2+4/3;
c = 1;
L = 1;
T = 1;
dx = L/100;
dt = T/100;
a0 = 1;
a1 = 0;
x = [0:dx:L]';
n = L/dx;
u = f([dx:dx:L-dx])';
uext = [a0;u;a1];
r = c*dt/(dx^2);
sides = -r*ones(n-2,1);
middle = (1+2*r)*ones(n-1,1);
three_d = zeros(T/dx+1,n+1);
for i=1:T/dt+1 % Time step of the function in 2D
    rhs = u+r*[a0;zeros(n-3,1);a1];
    u = thomas(sides,middle,sides,rhs,n-1);
    uext = [a0;u;a1];
    three_d(i,:) = uext;
    plot(x,uext);
    title('Solution to Heat Equation using Tridiagonal Matrices');
    xlabel('Length along rod');
    ylabel('Temperature Value of rod');
    xlim([0 1]);
    ylim([0 1.5]);
    % Change below line to change animation speed.
    pause(0.5);
end

% I also attempted to make it 3D to be more visual, and you can see the
% change.
% Graph is (position, time, temperatue) -> (x,y,z)
figure;
surf(0:dx:L,0:dt:T,three_d);
title('3D representation of Heat Soution');
xlabel('Length along rod');
ylabel('Time passed');
zlabel('Temperature at Position l and Time t');

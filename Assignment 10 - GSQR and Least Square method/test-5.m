% Math 146 HW 10 MATLAB section

% Part 1
A = [1 2 3; 4 5 6; 7 8 9];
[Q1,R1] = ModGSQR(A)
[Q2,R2] = OrigGSQR(A)
% The results in these are identical (for thes example
% The change I made in Orig was that I computed the dot products all at
% once and then subtracted the vectors all at once, rather than one at a
% time.

% Part 2
% The bonus stuff
%[e1,e2,e3,e4] = testGSQR(100)

% So I ran the test multiple times and these are my observations. The
% values of e1 and e2 indicate how close Q*R is to A. Generally, the
% Modifed version is closer, but not by a lot. The real comparison happens
% with e3 and e4. Because the matrix Q is orthonormal, multiplying it with
% its transpose should result in the identity matrix. The modifed version
% is significantly more accurate (by a factor of 10 at least) which is
% important because we want an accurate QR decomposition for other uses.

% Part 3
% The least square approach
t = [-4:0.5:3]';
y = t.*t;
n = 1;
p = lsq(t,y,n)
p = fliplr(p')'; % Changes the order for polyval;
z = polyval(p,t);
plot(t,y);
hold on;
plot(t,z);
hold off
% I plotted a graph to show how close the values get to 2*sin(t) as n
% increases. This is just to demonstrate that it works.


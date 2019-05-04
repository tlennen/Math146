% MATLAB HW 12 SVD compression

photo = 'horsehead-nebula.tif';
ek = [1:5];
ek(1) = svd_compression(photo,'10');
ek(2)=svd_compression(photo,'20');
ek(3)=svd_compression(photo,'50');
ek(4)=svd_compression(photo,'100');
ek(5)=svd_compression(photo,'200');
% Comparing the photos
% The visual quality of the images is minimal when comparing the different
% images. I looked really closely on my screen and I don't see that many
% losses in details in any of them. There might be some loss in detail in
% the 200 one but I can barely see it. Increasing the value of the modes
% makes it clearer and eventually it is all black (500 was all black). At
% 400, the difference is very clear. The image is much blurrier.



% Plot the sigma vs modes
I = im2double(imread(photo));
[U,S,V] = svd(I);
sigma = diag(S);
x = [1:size(sigma,1)];
plot(x,sigma);
title('Plot of modes vs sigma');
ylabel('Sigma');
xlabel('Modes');
% The result of the graph shows that the image has many small and
% "unimportant" sigma values. It is very L shaped, which measn there are a
% few big values that dictate most of the image with many valeus that can
% be removed that do not reduce the visual quality of the image. This is
% perfect for image compression.

% Error analysis
x = [10,20,50,100,200];
figure;
plot(x,ek);
title('Plot of modes vs error (1-norm of A-I)');
ylabel('Error');
xlabel('Modes');

% Discussion
% The error is the 1-norm of the difference between the two matrices(
% calcualted in svd_compression). The 1-norm is the max value in the matrix
% aka the biggest difference in numbers in the matrix. The trend, according
% the graph, shows that there is a correlation between more modes and more
% error. The error is minimal with 10 modes compareds to 200 modes ( less
% than 0.1 comapred to greater than 2.0). I would guess the error is
% exponential, as the more modes that are removed, the more change each
% sigma is going to make.
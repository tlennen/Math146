function y = svd_compression(img,model)
    mode = str2double(model);
    I = im2double(imread(img));
    [U,S,V] = svd(I);
    n = min(size(S,1),size(S,2));
    for i=1:mode
        for j=n:-1:1
            if S(j,j)~=0
                S(j,j)=0;
                break; % stops loop
            end
        end
    end
    A = U*S*V';
    y = norm(I-A,1);
    A = mat2gray(A);
    imwrite(A, strcat(model,'_svd_compress.tif'));
end
i = 50;
j = 0;
M = [1, 0, i;
    0, 1, j;
    0, 0, 1];

tform = affine2d(M');
ref2d = imref2d(size(image));
imageWarped = imwarp(image, tform, 'OutputView', ref2d, 'FillValues', 0);

candidate = imageWarped(roi(2) : roi(2) + roi(4) - 1, roi(1) : roi(1) + roi(3) - 1)

D = double(candidate) - double(target);
imshow(mat2gray(D))
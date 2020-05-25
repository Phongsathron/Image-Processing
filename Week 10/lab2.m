A = imread('broken-text.tif');
B = [0 1 0 0;
    0 1 1 0;
    1 1 1 1;
    0 1 0 0];

A2 = imdilate(A, B);
figure(1); imshow(A);
figure(2); imshow(A2);
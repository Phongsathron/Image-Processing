f = imread('test_pattern_with_single_pixel.tif');
figure(1); imshow(f);

w = [-1 -1 -1; -1 8 -1; -1 -1 -1];

g = abs(imfilter(double(f), w));
T = max(g(:));
g = g >= T;

figure(2); imshow(g);
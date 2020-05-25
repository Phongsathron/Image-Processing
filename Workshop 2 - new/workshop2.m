clear all;
clc all;

% Figure 1

f = imread('lenna_color.jpg');
imwrite(f, 'lenna_jung.jpg', 'quality', 5);

f2 = imread('lenna_jung.jpg');
figure, subplot(2,2,1), imshow(f2);

f2g = rgb2gray(f2);
subplot(2,2,2), imshow(f2g);

f2lr = f2g(1:end, end:-1:1);
subplot(2,2,3), imshow(f2g);
subplot(2,2,4), imshow(f2lr);

% Figure 2
[lmax, lmin, lmean, b] = lenajung(f2lr);
lmax, lmin, lmean

% Figure 3
sum_intensity(f2g)

% Figure 4
p = rgb2gray(f);

c = p(50:end-50, 50:end-50);
figure, imshow(c)

% Figure 5
g = p(:, end:-1:1)';
figure, imshow(g)

% Figure 6
h = uint8(false(size(p)+20));
h(11:end-10, 11:end-10) = p;
figure, imshow(h)

% Figure 7
h2 = p;
h2(1:113, :) = p(113:end, :);
h2(113:end, :) = p(1:113, :);
figure, imshow(h2)

% Figure 8
h3 = p;
h3(1:113, 1:113) = p(113:end, 113:end);
h3(1:113, 113:end) = p(113:end, 1:113);
h3(113:end, 1:113) = p(1:113, 113:end);
h3(113:end, 113:end) = p(1:113, 1:113);

figure, imshow(h3)

% Figure 9
h4 = p;
h4(51:end-50, 51:end-50) = 255;
figure, imshow(h4);

% Figure 10
h5 = imbinarize(p, 0.43);
figure, imshow(h5);

clear all;
close all;

f = imread('lena.bmp');
T = []
[g1, t1] = edge(f, 'sobel', T, 'vertical');
figure(1); imshow(g1, []);

[g2, t2] = edge(f, 'prewitt', T, 'vertical');
figure(2); imshow(g2, []);

[g3, t3] = edge(f, 'roberts', T, 'vertical');
figure(3); imshow(g3, []);

sigma = 1;
[g4, t4] = edge(f, 'log', T, sigma);
figure(4); imshow(g4, []);

H = fspecial('sobel');
[g5, t5] = edge(f, 'zerocross');
figure(5); imshow(g5, []);

f = imread('building.tif');
T = [];
sigma = 1;
[g7, t7] = edge(f, 'canny', T, sigma);
figure(6); imshow(g7, []);
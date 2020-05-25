% -- Workshop on Image Restoration (Part II) --

close all
clear all
%% -- Create checkerboard image --
f = checkerboard(20);
figure(1), imshow(f);

%% -- Motion filter #1 --
PSF1 = fspecial('motion', 10, 20);
%%
% gb1 = imfilter(f, PSF1, 'circular');
% figure(2), imshow(gb1);

%% -- Motion filter #2 --
PSF2 = fspecial('motion', 100, 20);
%%
% gb2 = imfilter(f, PSF2, 'circular');
% figure(3), imshow(gb2);

%% -- Motion filter #3 --
PSF3 = fspecial('motion', 50, -40);
%%
% gb3 = imfilter(f, PSF3, 'circular');
% figure(4), imshow(gb3);

%% -- Filter lena image --
% Load image
f = imread('lena.bmp');
figure;
subplot(2, 2, 1), imshow(f);

gb1 = imfilter(f, PSF1, 'circular');
gb2 = imfilter(f, PSF2, 'circular');
gb3 = imfilter(f, PSF3, 'circular');

subplot(2, 2, 2), imshow(gb1);
subplot(2, 2, 3), imshow(gb2);
subplot(2, 2, 4), imshow(gb3);
%% -- Restoration by Using Direct Inverse Filter Technique --
fr1 = deconvwnr(gb1, PSF1);
fr2 = deconvwnr(gb2, PSF2);
fr3 = deconvwnr(gb3, PSF3);

figure('Name', 'Restore using Direct Inverse Filter');
subplot(2, 2, 2), imshow(im2uint8(mat2gray(fr1)));
subplot(2, 2, 3), imshow(im2uint8(mat2gray(fr2)));
subplot(2, 2, 4), imshow(im2uint8(mat2gray(fr3)));

%% -- Restoration by Using Constrained Least Squares (Regularized) --
fr1 = deconvreg(gb1, PSF1);

figure('Name', 'Restore using Constrained Least Squares');
subplot(2, 2, 2), imshow(im2uint8(mat2gray(fr1)));
%%
fr2 = deconvreg(gb2, PSF2);
subplot(2, 2, 3), imshow(im2uint8(mat2gray(fr2)));
%%
fr3 = deconvreg(gb3, PSF3);
subplot(2, 2, 4), imshow(im2uint8(mat2gray(fr3)));
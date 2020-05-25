close all
clear all

% ---- (1) ---- %
f1 = imread('SQ.png');
f1 = rgb2gray(f1);
F1 = fft2(double(f1));

F1c = fftshift(F1);
F1c = log(1+abs(F1c));
figure(1);
imshow(abs(F1c), [])

% ---- (2) ---- %
f2 = imread('Reg_0.png');
f2 = rgb2gray(f2);
F2 = fft2(double(f2));

F2c = fftshift(F2);
F2c = log(1+abs(F2c));
figure(2);
imshow(abs(F2c), [])


% ---- (3) ---- %
f3 = imread('Reg_90.png');
f3 = rgb2gray(f3);
F3 = fft2(double(f3));

F3c = fftshift(F3);
F3c = log(1+abs(F3c));
figure(3);
imshow(abs(F3c), [])
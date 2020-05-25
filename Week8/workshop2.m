clear all;
close all;

%%
f = imread('lena.bmp');
sz = size(f);
figure(), imshow(f);

%% Noise 1
C1 = [6 -8; 5 6; 5 4; 5 -6; 7 9; 10 5];
[r1, R1, S1] = imnoise3(sz(1), sz(2), C1);
figure(), imshow(r1, []);
figure(), imshow(S1, []);

%% Noise 2
C2 = [30 1];
[r2, R2, S2] = imnoise3(sz(1), sz(2), C2);
figure(), imshow(r2, []);
figure(), imshow(S2, []);

%% Noise 3
C3 = [30 1; 1 30];
[r3, R3, S3] = imnoise3(sz(1), sz(2), C3);
figure(), imshow(r3, []);
figure(), imshow(S3, []);

%%
fn1 = (double(f) + (mat2gray(r1).*255))./2;
figure(), imshow(fn1, []);

%%
fn2 = (double(f) + (mat2gray(r2).*255))./2;
figure(), imshow(fn2, []);

%%
fn3 = (double(f) + (mat2gray(r3).*255))./2;
figure(), imshow(fn3, []);

%% Testing
F = fft2(mat2gray(fn2));
F = fftshift(F);
figure(), mesh(abs(F));
figure(), imshow(log(1 + abs(F)), []);

%% Image Restoration
H = imcomplement(r2);
figure(), imshow(H, []);
T = fft2(H)
H1 = fftshift(T);
figure(), imshow(uint8(H1.*255), []);

g = dftfilt(fn2, H);
figure(), imshow(uint8(g), []);

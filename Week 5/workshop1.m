close all;
clear all;

%% Filters
h1 = [
    -1 -1 -1;
    -1 8 -1;
    -1 -1 -1]
figure(1);
freqz2(h1);

h2 = [
    1 1 1;
    1 -8 1;
    1 1 1]
figure(2);
freqz2(h2);

h3 = [
    1 1 0;
    1 0 1;
    0 1 1]
figure(3);
freqz2(h3);


%% Load Image
f = imread('lena.bmp');
PQ = paddedsize(size(f));
F = fft2(f);
S = fftshift(log(1+abs(F)));
S = gscale(S);

%% Filter h1
H = freqz2(h1, PQ(1), PQ(2));
H1 = fftshift(H);
figure(4);
subplot(1, 3, 1); imshow(abs(H1), []);

%% Filter h2
H = freqz2(h2, PQ(1), PQ(2));
H2 = fftshift(H);
subplot(1, 3, 2); imshow(abs(H2), []);

%% Filter h3
H = freqz2(h3, PQ(1), PQ(2));
H3 = fftshift(H);
subplot(1, 3, 3); imshow(abs(H3), []);

%% Apply filter h1 on frequency domain

ft1 = fft2(f, size(H1, 1), size(H1, 2));
G1 = H1.*ft1;
g1 = real(ifft2(G1));
g1 = g1(1:size(f,1), 1:size(f,2));

figure(5);
subplot(1,3,1); imshow(g1, []);

%% Apply filter h2 on frequency domain

ft2 = fft2(f, size(H2, 1), size(H2, 2));
G2 = H2.*ft2;
g2 = real(ifft2(G2));
g2 = g2(1:size(f,1), 1:size(f,2));

subplot(1,3,2); imshow(g2, []);

%% Apply filter h3 on frequency domain

ft3 = fft2(f, size(H3, 1), size(H3, 2));
G3 = H3.*ft3;
g3 = real(ifft2(G3));
g3 = g3(1:size(f,1), 1:size(f,2));

subplot(1,3,3); imshow(g3, []);

%% Create own highpass filter

h4 = [
    3 3 3
    0 0 0
    -3 -3 -3
    ];

figure(6)
freqz2(h4)

h5 = [
    1 1 1 1
    1 -5 -5 1
    1 1 1 1
    ];

figure(7)
freqz2(h5)

H6 = freqz2(h5, PQ(1), PQ(2));
H6

gf = dftfilt(f, H6);
figure(8); imshow(gf, []);

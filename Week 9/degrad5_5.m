clear all
close all
%% -- Modeling the Degradation Function --

f = checkerboard(8);
figure, imshow(im2uint8(mat2gray(f)));
%%

PSF = fspecial('motion', 7, 45);
gb = imfilter(f, PSF, 'circular');
figure(1), imshow(im2uint8(mat2gray(gb)));
%%

noise = imnoise(zeros(size(f)), 'gaussian', 0, 0.001);
figure(2), imshow(im2uint8(mat2gray(noise)));
%%

g = gb + noise;
%%

figure(3), imshow(im2uint8(mat2gray(g)));
figure(4), imshow(pixeldup(f, 8), []);
%% --   Restoration by Using Direct Inverse Filter Technique --
%       via deconvwnr function ---

fr1 = deconvwnr(g, PSF);
figure(5), imshow(im2uint8(mat2gray(fr1)));
%%

Sn = abs(fft2(noise)).^2;                   % noise power spectrum
% nA = sum(Sn(:))/prod(size(noise));
nA = sum(Sn(:))/numel(noise);               % noise average power
Sf = abs(fft2(f)).^2;                       % image power spectrum
% fA = sum(Sf(:))/prod(size(f));
fA = sum(Sf(:))/numel(f);                   % image average power
R = nA/fA;
%%

fr2 = deconvwnr(g, PSF, R);
figure(6), imshow(im2uint8(mat2gray(fr2)));
%% -- Restoration by Using Autocorrelation function --

NCORR = fftshift(real(ifft2(Sn)));
ICORR = fftshift(real(ifft2(Sf)));
fr3 = deconvwnr(g, PSF, NCORR, ICORR);
figure(7), imshow(im2uint8(mat2gray(fr3)));

%% --   Restoration by Using Constrained Least Squares (Regularized)
%       Filtering ---

fr4 = deconvreg(g, PSF, 2);     % noise power is approximately 2
figure(8), imshow(im2uint8(mat2gray(fr4)));

%%

fr5 = deconvreg(g, PSF, 0.4, [1e-7 1e7]);
figure(9), imshow(im2uint8(mat2gray(fr5)));

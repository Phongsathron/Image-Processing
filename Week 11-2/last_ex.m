clear all
close all

f = imread('gel.tif');
figure(1), imshow(f);

h = fspecial('sobel');
fd = double(f);
g = sqrt(imfilter(fd, h, 'replicate').^2 + ...
        imfilter(fd, h, 'replicate').^2);
    
g1 = log2(1+double(g));
figure, imshow(mat2gray(g1));

L = watershed(g);
wr = L==0;
figure, imshow(wr);

rm = imregionalmin(g);
figure, imshow(rm);

im = imextendedmin(f, 2);
fim = f;
fim(im) = 175;
figure, imshow(fim);

Lim = watershed(bwdist(im));
em = Lim == 0;
figure, imshow(em);

gg = mat2gray(g1);
g2 = imimposemin(gg, em | im);

figure, imshow(g2);

L2 = watershed(g2);
f2 = f;
f2(L2==0) = 255;
figure, imshow(f2);
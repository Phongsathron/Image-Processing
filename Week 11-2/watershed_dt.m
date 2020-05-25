clear all
close all

f = imread('bwdowel.tif');
figure, imshow(f);

gc = ~f;
figure, imshow(gc);

D = bwdist(gc);
figure, imshow(mat2gray(D));

L = watershed(-D);
figure, imshow(~L);

w = (L==0);
g2 = f & ~w;
figure, imshow(g2);

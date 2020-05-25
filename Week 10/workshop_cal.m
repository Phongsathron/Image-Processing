clear all;
close all;

f = imread('calculator.tif');
f_obr = imreconstruct(imerode(f, ones(1,71)), f);
f_obrs = imsubtract(f, f_obr);
g_obr = imreconstruct(imerode(f_obrs, ones(1, 11)), f_obrs);
g_obrd = imdilate(g_obr, ones(1,21));
f2 = imreconstruct(min(g_obrd, f_obrs), f_obrs);
f3 = imerode(f2, ones(1, 5));
f4 = imdilate(f3, ones(1, 31));
f5 = imreconstruct(max(f3, f4), f2);
f6 = graythresh(f5);
f6 = im2bw(f5, f6);

figure, imshow(f_obr);
figure, imshow(f_obrs);
figure, imshow(g_obr);
figure, imshow(g_obrd);
figure, imshow(f2);
figure, imshow(f3);
figure, imshow(f4);
figure, imshow(f5);
% figure, imshow(f6);
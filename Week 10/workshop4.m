clear all;
close all;

f = imread('rice.tif');
se = strel('disk', 10);
fo = imopen(f, se);
f2 = imsubtract(f, fo);
f22 = imtophat(f, se);

level = graythresh(f);
BW = im2bw(f, level);

th = graythresh(f2);
BW_rice = im2bw(f2, th);

figure(1); imshow(f);
figure(2); imshow(fo);
figure(3); imshow(f2);
figure(4); imshow(f22);
figure(5); imshow(BW);
figure(6); imshow(BW_rice);

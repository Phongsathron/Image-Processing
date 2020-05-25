close all
clear all

f = imread('small_squares.tif');
figure(1); imshow(f);

S1 = [0 0 0;
    1 1 0;
    0 1 0];

S2 = [1 1 1;
    0 0 1;
    0 0 1];

B1 = strel(S1);
B2 = strel(S2);
g = bwhitmiss(f, B1, B2);
figure(2); imshow(g, []);

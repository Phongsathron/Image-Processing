clear all;
close all;

f = imread('dowels.tif');
se = strel('disk', 5);

% ----- Opening by reconstruction ----- %
fe = imerode(f, se);            % Generate a maker, fe.
fobr = imreconstruct(fe, f);    % f is a mark.

% ----- Closing by reconstruction ----- %
fobrc = imcomplement(fobr);
fobrce = imerode(fobrc, se);
fobrcer = imcomplement(imreconstruct(fobrce, fobrc));

figure, imshow(f);
figure, imshow(fe);
figure, imshow(fobr);
figure, imshow(fobrcer);
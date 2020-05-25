f = imread('breast.tif');
g1 = imadjust(f, [0 1], [1 0]);
g11 = imcomplement(f);
imshow(g1), figure, imshow(g11)
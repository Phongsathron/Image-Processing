f = imread('rice.tif');
figure(1), imshow(f);
se = strel('disk', 10);
fo = imopen(f, se);
figure(2), imshow(fo);
To = graythresh(fo);
T = fo + (To * 255);
figure(3), imshow(T);
[m, n] = size(f);
out = zeros(m, n);
out_idx = find(f >= T);
out(out_idx) = 1;
figure(4), imshow(out);
To
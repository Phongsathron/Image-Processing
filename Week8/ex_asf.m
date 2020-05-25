f = imread('lena.bmp');
g = imnoise(f, 'salt & pepper', 0.20);
f1 = medfilt2(g, [5 5], 'symmetric');
f2 = adpmedian(g, 11);

figure(1); imshow(f);
figure(2); imshow(g);
figure(3); imshow(f1);
figure(4); imshow(f2);
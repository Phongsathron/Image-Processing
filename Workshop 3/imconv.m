function res = imconv(f)

s = rgb2gray(f);

w = [
    0 0 0;
    0 8 0;
    0 0 0;
]

res = imfilter(s, w, 'conv');
res2 = conv2(s, w);

figure();
subplot(1, 3, 1); imshow(s);
subplot(1, 3, 2); imshow(res);
subplot(1, 3, 3); imshow(res2);
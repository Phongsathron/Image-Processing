clear all;
close all;

f = imread('wirebond_mask.tif');
figure(1); imshow(f);

w = [2 -1 -1;
    -1 2 -1;
    -1 -1 2];

g = abs(imfilter(double(f), w));
figure; imshow(g, []);
T = max(g(:));
g = (g >= T);
figure(3); imshow(g);

w = [-1 -1 -1;
    2 2 2;
    -1 -1 -1];
g = abs(imfilter(double(f), w));
figure; imshow(g, []);
T = max(g(:));
g = (g >= T);
figure(3); imshow(g);

% gtop = g(1:120, 1:120);
% figure(3); imshow(gtop, []);
% 
% gbot = g(end-119:end, end-119:end);
% figure(4), imshow(gbot, []);
% g = abs(g);
% figure(5); imshow(g, []);

% T = max(g(:));
% g = (g >= T);
% figure(3); imshow(g);
% 
% w2 = [-1 2 -1;
%     -1 2 -1;
%     -1 2 -1];
% g2 = abs(imfilter(double(f), w2));
% figure(4); imshow(g2, []);
% 
% T2 = max(g2(:));
% g2 = (g2 >= T2);
% figure(5); imshow(g2);
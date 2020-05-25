% example 1
x = uint8(1:255);
r1 = imadjust(x, [0 1], [0 1], 0.25);
r2 = imadjust(x, [0 1], [0 1], 0.50);
r3 = imadjust(x, [0 1], [0 1], 0.75);
r4 = imadjust(x, [0 1], [0 1], 1.00);

plot(x, r1, x, r2, x, r3, x, r4);
legend('gamma = 0.25', 'gamma = 0.50', 'gamma = 0.75', 'gamma = 1.0')

x = imread('breast.tif');
r1 = imadjust(x, [0 1], [0 1], 0.25);
r2 = imadjust(x, [0 1], [0 1], 0.50);
r3 = imadjust(x, [0 1], [0 1], 0.75);
r4 = imadjust(x, [0 1], [0 1], 1.00);

figure();
subplot(2,2,1), imshow(r1);
subplot(2,2,2), imshow(r2);
subplot(2,2,3), imshow(r3);
subplot(2,2,4), imshow(r4);

figure(), imshow(x);
f = imread('building.tif');

g_canny_best = edge(f, 'canny', [0.04 0.10], 1.5);
figure(1); imshow(g_canny_best)

[H, theta, rho] = hough(g_canny_best, 0.5);
figure(2);
imshow(H, 'XData', theta, 'YData', rho); axis on, axis normal;
xlabel('\theta'), ylabel('\rho');

[r, c] = houghpeaks(H, 3);

hold on
plot(theta(c), rho(r), 'linestyle', 'none', 'marker', ...
    's', 'color', 'w');

lines = houghlines(g_canny_best, theta, rho, r, c);
figure(3); imshow(g_canny_best), hold on
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,2), xy(:, 1), 'LineWidth', 4, 'Color', ...
        [.6 .6 .6]);
end
w = 0:2*pi/20:2*pi;
y = 5*sin(w);
se = [1 1 1 1 1];
yd = imerode(y, se);
plot(y);
hold on;
plot(yd, '-r');
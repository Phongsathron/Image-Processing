function [] = workshop(r)

if 1 >= r >= -1
    x = 2*r;
elseif r > 1
    x = ((2*r)/3) + (4/3);
else
    x = ((2*r)/3) - (4/3);
end

imshow(x)
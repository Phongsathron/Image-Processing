f = imread('dowels.tif');
se = strel('disk', 5);
fo = imopen(f, se);
foc = imclose(fo, se);
figure, imshow(f);
figure, imshow(fo);
figure, imshow(foc);

%%
fasf = f;
for k = 2:5
    se = strel('diamond', k);
    fasf = imclose(imopen(fasf, se), se);
end
figure, imshow(fasf);

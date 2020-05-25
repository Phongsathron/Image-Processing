close all
clear all

utk = imread('utk.tif');
gt = imread('gt.tif');
figure('name', 'original utk'); imshow(utk);
figure('name', 'original gt'); imshow(gt);

comp_utk = ~utk;
figure('name', 'complement utk'); imshow(comp_utk);

AorB = utk | gt;        % A union B
AandB = utk & gt;       % A intersection B
AanddifB = utk & ~gt;

figure('name', 'A or B'); imshow(AorB);
figure('name', 'A and B'); imshow(AandB);
figure('name', 'A and dif B'); imshow(AanddifB);
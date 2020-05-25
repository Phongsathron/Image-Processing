% camera = webcam;
% f = camera.snapshot;
%%
f = imread('download.jpeg');
%%
picture = imresize(f,[227,227]);    % Resize the picture
nnet = alexnet;
label = classify(nnet, picture);    % Classify the picture
image(picture);                     % Show the picture
title(char(label));                 % Show the label
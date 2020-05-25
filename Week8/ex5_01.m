clear all
close all;

C = [ 6 32;
      -2 2];
  
[r, R, S] = imnoise3(512, 512, C);
figure, imshow(S, []);
figure, imshow(r, []);

pause;

clear all
close all;

C = [1 5];
[r, R, S] = imnoise3(512, 512, C);
figure, imshow(S, []);
figure, imshow(r, []);
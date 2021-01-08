rgb=imread('C:\Users\Suppakorn\Documents\raw.png');
subplot(2,2,1);
imshow(rgb);
title('raw image');
g= rgb2gray(rgb);
subplot(2,2,2);
imshow(g);
title('gray image');

apple_tolerance=81;
apple_row = 681;
apple_col = 318;
apple = grayconnected(g,apple_row,apple_col,apple_tolerance);% ready used seed pixel code from matlab
subplot(2,2,3);
imshow(apple);
title('apple');

orange_tolerance=19;
orange_row = 693;
orange_col = 747;
orange = grayconnected(g,orange_row,orange_col,orange_tolerance);
subplot(2,2,4);
imshow(orange);
title('orange');

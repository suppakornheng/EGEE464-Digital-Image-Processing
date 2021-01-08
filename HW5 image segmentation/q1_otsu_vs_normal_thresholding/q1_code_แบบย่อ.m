%otsu จะสะดวกกว่าเพราะมีอัลกอริทึมเลือก threshold ให้เลย แต่อาจจะไม่ตอบโจทย์เท่าใช้คนเลือก
rgb=imread('C:\Users\Suppakorn\Documents\m&m_snack_on_a_pan.png');
g = rgb2gray(rgb);
subplot(2,2,1);
imshow(g);
title('raw image');

subplot(2,2,2);
imhist(g);%show histogram of the grayscale image for choosing threshold
title('histogram');
%chosse threshold = 108
thres = 108/255;

%normal method
normal_res = imbinarize(g,thres);%matlab ready used code for thresholding
subplot(2,2,3);
imshow(normal_res);
title('normal threshold');


%otsu's method
otsu_thres = graythresh(g);%graythresh = matlab ready used code for finding otsu's threshold
%otsu_thres = 0.3804, threshold = 0.3804*255 = 97
otsu_res = imbinarize(g,otsu_thres);
subplot(2,2,4);
imshow(otsu_res);
title('otsu threshold');





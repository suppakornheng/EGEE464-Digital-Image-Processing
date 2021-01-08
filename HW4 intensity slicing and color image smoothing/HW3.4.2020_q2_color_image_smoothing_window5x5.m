rgb=imread('C:\Users\Suppakorn\Documents\raw3.jpg');
figure(1);
% subplot(2,2,1);
imshow(rgb);
title('Raw Image RGB>Show');

r = rgb(:,:,1);
g = rgb(:,:,2);
b = rgb(:,:,3);
%median filter
rm = medfilt2(r,[5 5]);
gm = medfilt2(g,[5 5]);
bm = medfilt2(b,[5 5]);
%concatenate
rgbm = cat(3,rm,gm,bm);
figure(2);
% subplot(2,2,2);
imshow(rgbm);
title('2.1 RGB>Filt>Show');

hsv = rgb2hsv(rgb);
h = hsv(:,:,1);
s = hsv(:,:,2);
v = hsv(:,:,3);
vm = medfilt2(v,[5 5]);
hsvm = cat(3,h,s,v);
% subplot(2,2,3);
figure(3);
imshow(hsvm);
title('2.2 RGB>HSV>Filt>Show');
% colormap hsv;


rgb3 = hsv2rgb(hsvm);
figure(4);
% subplot(2,2,4);
imshow(rgb3);
title('2.3 RGB>HSV>Filt>RGB>Show');






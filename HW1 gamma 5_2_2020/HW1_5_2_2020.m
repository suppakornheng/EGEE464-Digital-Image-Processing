rgbImg = imread('C:\Users\Suppakorn\Documents\old_lena_RGB_30x30.png');
%imgshow(rgbImg);
grayImg = rgb2gray(rgbImg);
%imshow(grayImg);
[row,col] = size(grayImg);
grayImg_d = double(grayImg);
%set
C=1;
gamma=[0.1,0.2,0.67,1,5.0];

for i = 1:5
	for c = 1:col
   	 	for r = 1:row
        		grayImgAfter_d(r,c,i) = C*(grayImg_d(r,c).^gamma(i));
    			end	
	end
end

grayImgAfter_int = uint8(grayImgAfter_d);

imshow(grayImgAfter_int(:,:,1));%gamma=0.1
imshow(grayImgAfter_int(:,:,2));%gamma=0.2
imshow(grayImgAfter_int(:,:,3));%gamma=0.67
imshow(grayImgAfter_int(:,:,4));%gamma=1
imshow(grayImgAfter_int(:,:,5));%gamma=5.0





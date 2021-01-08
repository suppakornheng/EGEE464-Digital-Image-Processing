%Problem 1
%Salt and Pepeer noise with three "d" value -> 3pic
%median filter-> 3 pic
%Mean filter-> 3 pic
%9 result images

%Problem 2
%repeat Problem 1 change S&P to Gaussian noise with Varience -> 3 ???
%??????? median, Mean filter
%9 result images

%Problem 3
%??? S%P ??????? Gaussian noise ??????? median, Mean filter
%9 result images

rgbImg = imread('C:\Users\Suppakorn\Documents\old_lena_RGB_300x300.png');
%imgshow(rgbImg);
grayImg = rgb2gray(rgbImg);
imshow(grayImg);

%Problem1%%%%%%%%%%%%%%%%%%%%%
%%%%% Add Noise %%%%%%%%%%%%%%
SP_20 = imnoise(grayImg,'salt & pepper',0.20);
SP_40 = imnoise(grayImg,'salt & pepper',0.40);
SP_60 = imnoise(grayImg,'salt & pepper',0.60);
%%%%% Padding %%%%%%%%%%%%%%%
d_SP_20 = double(padarray(SP_20,[1 1],0,'both'));
d_SP_40 = double(padarray(SP_40,[1 1],0,'both'));
d_SP_60 = double(padarray(SP_60,[1 1],0,'both'));
%%%%% Median filter %%%%%%%%%
median_SP_20 = uint8(medfilt2(SP_20,[3 3]));
median_SP_40 = uint8(medfilt2(SP_40,[3 3]));
median_SP_60 = uint8(medfilt2(SP_60,[3 3]));
%%%%% Mean filter %%%%%%%%%%%
[row,col] = size(d_SP_20);
for c  = 2:col-1
       for r = 2:row-1
            mean_SP_20(r-1,c-1) = uint8((d_SP_20(r-1,c-1)+d_SP_20(r,c-1)+d_SP_20(r+1,c-1)+d_SP_20(r-1,c)+d_SP_20(r,c)+d_SP_20(r+1,c)+d_SP_20(r-1,c+1)+d_SP_20(r,c+1)+d_SP_20(r+1,c+1))/9);
            mean_SP_40(r-1,c-1) = uint8((d_SP_40(r-1,c-1)+d_SP_40(r,c-1)+d_SP_40(r+1,c-1)+d_SP_40(r-1,c)+d_SP_40(r,c)+d_SP_40(r+1,c)+d_SP_40(r-1,c+1)+d_SP_40(r,c+1)+d_SP_40(r+1,c+1))/9);
            mean_SP_60(r-1,c-1) = uint8((d_SP_60(r-1,c-1)+d_SP_60(r,c-1)+d_SP_60(r+1,c-1)+d_SP_60(r-1,c)+d_SP_60(r,c)+d_SP_60(r+1,c)+d_SP_60(r-1,c+1)+d_SP_60(r,c+1)+d_SP_60(r+1,c+1))/9);
       end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Problem2%%%%%%%%%%%%%%%%%%%%%
%%%%% Add Noise %%%%%%%%%%%%%%
Gaussian_20 = imnoise(grayImg,'gaussian',0.20);
Gaussian_40 = imnoise(grayImg,'gaussian',0.40);
Gaussian_60 = imnoise(grayImg,'gaussian',0.60);
%%%%% Padding 
d_Gaussian_20 = double(padarray(Gaussian_20,[1 1],0,'both'));
d_Gaussian_40 = double(padarray(Gaussian_40,[1 1],0,'both'));
d_Gaussian_60 = double(padarray(Gaussian_60,[1 1],0,'both'));
%%%%% Median filter %%%%%%%%%%
median_Gaussian_20 = uint8(medfilt2(Gaussian_20,[3 3]));
median_Gaussian_40 = uint8(medfilt2(Gaussian_40,[3 3]));
median_Gaussian_60 = uint8(medfilt2(Gaussian_60,[3 3]));
%%%%% Mean filter %%%%%%%%%%%%
[row,col] = size(d_Gaussian_20);
for c  = 2:col-1
       for r = 2:row-1
            mean_Gaussian_20(r-1,c-1) = uint8((d_Gaussian_20(r-1,c-1)+d_Gaussian_20(r,c-1)+d_Gaussian_20(r+1,c-1)+d_Gaussian_20(r-1,c)+d_Gaussian_20(r,c)+d_Gaussian_20(r+1,c)+d_Gaussian_20(r-1,c+1)+d_Gaussian_20(r,c+1)+d_Gaussian_20(r+1,c+1))/9);
            mean_Gaussian_40(r-1,c-1) = uint8((d_Gaussian_40(r-1,c-1)+d_Gaussian_40(r,c-1)+d_Gaussian_40(r+1,c-1)+d_Gaussian_40(r-1,c)+d_Gaussian_40(r,c)+d_Gaussian_40(r+1,c)+d_Gaussian_40(r-1,c+1)+d_Gaussian_40(r,c+1)+d_Gaussian_40(r+1,c+1))/9);
            mean_Gaussian_60(r-1,c-1) = uint8((d_Gaussian_60(r-1,c-1)+d_Gaussian_60(r,c-1)+d_Gaussian_60(r+1,c-1)+d_Gaussian_60(r-1,c)+d_Gaussian_60(r,c)+d_Gaussian_60(r+1,c)+d_Gaussian_60(r-1,c+1)+d_Gaussian_60(r,c+1)+d_Gaussian_60(r+1,c+1))/9);
       end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Problem3%%%%%%%%%%%%%%%%%%%%%
%%%%% Add Noise %%%%%%%%%%%%%%
Both_a = imnoise(grayImg,'gaussian',0.20);
Both_b = imnoise(grayImg,'gaussian',0.40);
Both_c = imnoise(grayImg,'gaussian',0.60);
Both_20 = imnoise(Both_a,'salt & pepper',0.20);
Both_40 = imnoise(Both_b,'salt & pepper',0.40);
Both_60 = imnoise(Both_c,'salt & pepper',0.60);
%%%%% Padding 
d_Both_20 = double(padarray(Both_20,[1 1],0,'both'));
d_Both_40 = double(padarray(Both_40,[1 1],0,'both'));
d_Both_60 = double(padarray(Both_60,[1 1],0,'both'));
%%%%% Median filter %%%%%%%%%%
median_Both_20 = uint8(medfilt2(Both_20,[3 3]));
median_Both_40 = uint8(medfilt2(Both_40,[3 3]));
median_Both_60 = uint8(medfilt2(Both_60,[3 3]));
%%%%% Mean filter %%%%%%%%%%%%
[row,col] = size(d_Both_20);
for c  = 2:col-1
       for r = 2:row-1
            mean_Both_20(r-1,c-1) = uint8((d_Both_20(r-1,c-1)+d_Both_20(r,c-1)+d_Both_20(r+1,c-1)+d_Both_20(r-1,c)+d_Both_20(r,c)+d_Both_20(r+1,c)+d_Both_20(r-1,c+1)+d_Both_20(r,c+1)+d_Both_20(r+1,c+1))/9);
            mean_Both_40(r-1,c-1) = uint8((d_Both_40(r-1,c-1)+d_Both_40(r,c-1)+d_Both_40(r+1,c-1)+d_Both_40(r-1,c)+d_Both_40(r,c)+d_Both_40(r+1,c)+d_Both_40(r-1,c+1)+d_Both_40(r,c+1)+d_Both_40(r+1,c+1))/9);
            mean_Both_60(r-1,c-1) = uint8((d_Both_60(r-1,c-1)+d_Both_60(r,c-1)+d_Both_60(r+1,c-1)+d_Both_60(r-1,c)+d_Both_60(r,c)+d_Both_60(r+1,c)+d_Both_60(r-1,c+1)+d_Both_60(r,c+1)+d_Both_60(r+1,c+1))/9);
       end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Show Problem 1 %%%%%%%%%%
figure(1);
subplot(3,3,1),imshow(SP_20);
title('S&P 20%');
subplot(3,3,2),imshow(SP_40);
title('S&P 40%');
subplot(3,3,3),imshow(SP_60);
title('S&P 60%');
subplot(3,3,4),imshow(median_SP_20);
title('S&P 20% median filter');
subplot(3,3,5),imshow(median_SP_40);
title('S&P 40% median filter');
subplot(3,3,6),imshow(median_SP_60);
title('S&P 60% median filter');
subplot(3,3,7),imshow(mean_SP_20);
title('S&P 20% mean filter');
subplot(3,3,8),imshow(mean_SP_40);
title('S&P 40% mean filter');
subplot(3,3,9),imshow(mean_SP_60);
title('S&P 60% mean filter');

%%%% Show Problem 2 %%%%%%%%%%
figure(2);
subplot(3,3,1),imshow(Gaussian_20);
title('Gaussian 20%');
subplot(3,3,2),imshow(Gaussian_40);
title('Gaussian 40%');
subplot(3,3,3),imshow(Gaussian_60);
title('Gaussian 60%');
subplot(3,3,4),imshow(median_Gaussian_20);
title('Gaussian 20% median filter');
subplot(3,3,5),imshow(median_Gaussian_40);
title('Gaussian 40% median filter');
subplot(3,3,6),imshow(median_Gaussian_60);
title('Gaussian 60% median filter');
subplot(3,3,7),imshow(mean_Gaussian_20);
title('Gaussian 20% mean filter');
subplot(3,3,8),imshow(mean_Gaussian_40);
title('Gaussian 40% mean filter');
subplot(3,3,9),imshow(mean_Gaussian_60);
title('Gaussian 60% mean filter');

%%%% Show Problem 3 %%%%%%%%%%
figure(3);
subplot(3,3,1),imshow(Both_20);
title('Both 20%');
subplot(3,3,2),imshow(Both_40);
title('Both 40%');
subplot(3,3,3),imshow(Both_60);
title('Both 60%');
subplot(3,3,4),imshow(median_Both_20);
title('Both 20% median filter');
subplot(3,3,5),imshow(median_Both_40);
title('Both 40% median filter');
subplot(3,3,6),imshow(median_Both_60);
title('Both 60% median filter');
subplot(3,3,7),imshow(mean_Both_20);
title('Both 20% mean filter');
subplot(3,3,8),imshow(mean_Both_40);
title('Both 40% mean filter');
subplot(3,3,9),imshow(mean_Both_60);
title('Both 60% mean filter');
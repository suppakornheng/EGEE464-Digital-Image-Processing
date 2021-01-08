% 1. cut off freq. 6 values = 10,20,30,50,150,450
% 2. order n 6 values  = 2,3,5,10,20,50
% 3. gaussian  Dispersion = cut off freq. 6 values =10,20,30,50,150,450

% Step
% 1. fft 
% 2. filter
%     G(u,v) = H(u,v)*F(u,v)
% 2.1 LPF ->  6 pics
%     H_LPF(u,v) = 1 if sqrt(u^2+v^2) <= r0
%     H_LPF(u,v) = 0 if sqrt(u^2+v^2) > r0
%     G_LPF(u,v) = H(u,v)*F(u,v)
% 2.2 Butterworth ->  36 pics
%     H_Butter(u,v) = 1/(1+((sqrt(u^2+v^2)/r0)^(2*n))
%     G_Butter(u,v) = H(u,v)*F(u,v)
% 2.3 Gaussian ->  6 pics
%     D_Gaus(u,v) = sqrt(u^2+v^2)
%     H_Gaus(u,v) = exp((-1*D^2)/(2*dispersion))
%     G_Gaus(u,v) = H(u,v)*F(u,v)
% 3. ifft


rgbImg = imread('C:\Users\Suppakorn\Documents\old_lena_RGB_300x300.png');
%imgshow(rgbImg);
grayImg = rgb2gray(rgbImg);
%imshow(grayImg);
grayImg_d = double(grayImg);
%imshow(grayImg_d); 

%step1 fft
fftImg = fft2(grayImg_d);

%step2 filter
[row,col] = size(fftImg);
r0 = [10 20 30 50 150 450];
orderN  = [2 3 5 10 20 50];
dispersion =1;
% i = index of r0 and orderN;
% j = index of orderN;
% u = index of column;
% v = index of row;

for i = 1: length(r0)
%    for j = 1: length(orderN)
        for u = 1:col
            for v = 1:row
                D= sqrt((u-row/2).^2+(v-row/2).^2);
                %LPF%%%%%%%%%%%%%%%%%%%%
                if(D <= r0(i)) 
                   H_LPF(u,v,i) = 1;
                else
                   H_LPF(u,v,i) = 0;
                end
                G_LPF(u,v,i)= H_LPF(u,v,i)*fftImg(u,v);             
                %END%%%%%%%%%%%%%%%%%%%%
%                 %ButterWorth%%%%%%%%%%%%
%                 H_Butter(u,v,i,j) = 1/(1+(D/r0(i))^(2*orderN(j)));
%                 G_Butter(u,v,i,j) = H_Butter(u,v,i)*fftImg(u,v);
%                 %END%%%%%%%%%%%%%%%%%%%%
%                 %Gaussian%%%%%%%%%%%%%%%
%                 H_Gaus(u,v,i)= exp((-1*(D.^2))/(2*(r0(i).^2)));
%                 G_Gaus(u,v,i)= H_Gaus(u,v,i)*fftImg(u,v);
%                 %END%%%%%%%%%%%%%%%%%%%%
            end
        end
%    end
end
for i=1:6
    I_LPF(:,:,i)= uint8(ifft2(G_LPF(:,:,i)));
%     I_Gaus(:,:,i)= uint8(ifft2(G_Gaus(:,:,i)));
%     for j=1:6
%         I_Butter(:,:,i,j)= uint8(ifft2(G_Gaus(:,:,i,j)));
%     end
end
% %LPF
% figure(1);
subplot(7,3,1),imshow(rgbImg);
title('RGB Image');
subplot(7,3,2),imshow(grayImg);
title('Grayscale Image (T-domain)');
subplot(7,3,3),mesh(abs(fftImg));
title('Grayscale Image (F-domain)');
for i= 1:6
    subplot(7,3,3*i+1),mesh(H_LPF(:,:,i));
    title(['filter Cut Off = ',num2str(r0(i))]);
    subplot(7,3,3*i+2),mesh(abs(G_LPF(:,:,i)));
    title(['Output (F-domain) = ',num2str(r0(i))]);
    subplot(7,3,3*i+3),mesh(abs(ifft(G_LPF(:,:,i)))));
    title(['Output (T-domain) = ',num2str(r0(i))]);
end
% %end
% %Butterworth
% figure(2);
% subplot(7,3,1),imshow(rgbImg);
% title('RGB Image');
% subplot(7,3,2),imshow(grayImg);
% title('Grayscale Image (T-domain)');
% subplot(7,3,3),mesh(abs(fftImg));
% title('Grayscale Image (F-domain)');
% k=1;
% for i= 1:6
%     for j=1:6
%     subplot(7,3,3*k+1),mesh(H_Butter(:,:,i,j));
%     title(['filter Cut Off = ',num2str(r0(i)),', Order = ',num2str(orderN(j))]);
%     subplot(7,3,3*k+2),mesh(abs(G_Butter(:,:,i,j)));
%     title(['Output (F-domain) = ',num2str(r0(i)),', Order = ',num2str(orderN(j))]);
%     subplot(7,3,3*k+3),imshow(uint8(ifft(G_Butter(:,:,i,j))));
%     title(['Output (T-domain) = ',num2str(r0(i)),', Order = ',num2str(orderN(j))]);
%     k=k+1;
%     end
% end
% %end
% %Gaussian
% figure(3);
% subplot(37,3,1),imshow(rgbImg);
% title('RGB Image');
% subplot(37,3,2),imshow(grayImg);
% title('Grayscale Image (T-domain)');
% subplot(7,3,3),mesh(abs(fftImg));
% title('Grayscale Image (F-domain)');
% for i= 1:6
%     subplot(7,3,3*i+1),mesh(H_Gaus(:,:,i));
%     title(['filter Cut Off = ',num2str(r0(i))]);
%     subplot(7,3,3*i+2),mesh(abs(G_Gaus(:,:,i)));
%     title(['Output (F-domain) = ',num2str(r0(i))]);
%     subplot(7,3,3*i+3),imshow(uint8(ifft2(G_Gaus(:,:,i))));
%     title(['Output (T-domain) = ',num2str(r0(i))]);
% end
% %end


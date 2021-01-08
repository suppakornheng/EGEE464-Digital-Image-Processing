%step1 insert image
rgbImg = imread('C:\Users\Suppakorn\Documents\old_lena_RGB_300x300.png');
I = double(rgb2gray(rgbImg));
F = fftshift(fft2(I));
%step2 create filter
r0 = [10 20 30 50 150 450];
orderN  = [2 3 5 10 20 50];
% i = index of r0 and orderN;
% j = index of orderN;
% u = index of column;
% v = index of row;
for i = 1: 6
    for u = 1:300
        for v = 1:300
                D= sqrt((u-150).^2+(v-150).^2);
                %LPF
                if(D <= r0(i)) 
                   LPF(u,v,i) = 1;
                else
                   LPF(u,v,i) = 0;
                end
                for j=1:6
                %ButterWorth
                But(u,v,i,j) = 1/(1+(D/r0(i))^(2*orderN(j)));
                end
                %Gaussian
                Gau(u,v,i)= exp((-1*(D.^2))/(2*(r0(i).^2)));
                
        end
    end
end
%step3 multiply in fourier domain
%LPF
figure(1);
for i=1:6
    out1=LPF(:,:,i).*F;
    out3=abs(ifft2(out1));
    out4=max(out3(:));
    subplot(2,3,i),imshow(out3/out4);
    title(['LPF f = ',num2str(r0(i))]);
end
%Gaussian
figure(2);
for i=1:6
    out1=Gau(:,:,i).*F;
    out3=abs(ifft2(out1));
    out4=max(out3(:));
    subplot(2,3,i),imshow(out3/out4);
    title(['Gaussian f = ',num2str(r0(i))]);
end
%Butterworth
k=1;
i=6;
for j= 1:6
        out1=But(:,:,i,j).*F;
        out3=abs(ifft2(out1));
        out4=max(out3(:));
        subplot(2,3,k),imshow(out3/out4);
        title(['Butter f = ',num2str(r0(i)),', n = ',num2str(orderN(j))]);
        k=k+1;
end

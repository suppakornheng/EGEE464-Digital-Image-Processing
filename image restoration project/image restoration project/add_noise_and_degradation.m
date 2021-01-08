rgb = imread('raw.png');
I = double(rgb2gray(rgb));

%add degradation
F = fftshift(fft2(I));
k = 0.0025;
[M,N]=size(F);
H = zeros(M,N);
for u=1:M
    for v=1:N
    H(u,v) = exp((-k)*(((u-M/2).^2-(v-N/2).^2).^5.6));
    end
end
G = H.*F;
S=abs(ifft2(G));
Sm=max(S(:));
raw_D = S/Sm;

% %add gaussian noise
% raw_G = imnoise(uint8(I),'gaussian');
% raw_D_G = imnoise(raw_D,'gaussian');
% 
% %add salt and pepper nosie 
% raw_SP = imnoise(uint8(I),'salt & pepper');
% raw_G_SP = imnoise(raw_G,'salt & pepper');
% raw_D_G_SP = imnoise(raw_D_G,'salt & pepper');
% 
% %add salt noise only
% raw_S = pepperOrSalt(uint8(I), 0.2, 1, 255, 255);%0.2=noisedistribution, 1=pepper
% raw_D_S = pepperOrSalt(raw_D, 0.2, 1, 255, 255);
% 
% 
% %add pepper noise only
% raw_P = pepperOrSalt(uint8(I), 0.2, 2, 0 , 0);%0.2=noisedistribution, 2=pepper
% raw_D_P = pepperOrSalt(raw_D, 0.2, 2, 0 , 0);

% There are 10 pictures
% 1.raw_D = degradation
% 2.raw_G = gaussian noise
% 3.raw_S = salt nosie
% 4.raw_P = pepper noise
% 5.raw_SP = S&P noise
% 6.raw_G_SP = guassian + S&P
% 7.raw_D_G = degradation + guassian
% 8.raw_D_S = drgradation + salt
% 9.raw_D_P = degradation + pepper
% 10.raw_D_SP = drgradation + S&P




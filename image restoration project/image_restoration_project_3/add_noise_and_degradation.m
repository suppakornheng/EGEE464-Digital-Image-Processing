rgb = imread('raw.png');
I = double(rgb2gray(rgb));
k=1;

%add degradation
h = fspecial('motion',21,11);
D = uint8(imfilter(I,h,'conv','circular'));

%add gaussian noise
G = imnoise(uint8(I),'gaussian');
DG = imnoise(D,'gaussian');

%add salt and pepper nosie 
SP = imnoise(uint8(I),'salt & pepper',0.01);
DSP = imnoise(D,'salt & pepper',0.01);
GSP = imnoise(G,'salt & pepper',0.01);
DGSP = imnoise(DG,'salt & pepper',0.01);

%add salt noise only
S = pepperOrSalt(uint8(I), 0.01, 1, 255, 255);%0.2=noisedistribution, 1=pepper
DS = pepperOrSalt(D, 0.01, 1, 255, 255);
GS = pepperOrSalt(G, 0.01, 1, 255, 255);
DGS = pepperOrSalt(DG, 0.01, 1, 255, 255);

%add pepper noise only
P = pepperOrSalt(uint8(I), 0.01, 2, 0 , 0);%0.2=noisedistribution, 2=pepper
DP = pepperOrSalt(D, 0.01, 2, 0 , 0);
GP = pepperOrSalt(G, 0.01, 2, 0 , 0);
DGP = pepperOrSalt(DG, 0.01, 2, 0 , 0);

% total 15 pictures
% D G S P
% 1.D	
% 2.G	
% 3.S	
% 4.P	
% 5.DG	
% 6.DS	
% 7.DP	
% 8.GS	
% 9.GP	
% 10.SP	
% 11.DGS	
% 12.DGP	
% 13.GSP	
% 14.DSP	
% 15.DGSP	
imwrite(D,'1.bmp');
imwrite(G,'2.bmp');
imwrite(S,'3.bmp');
imwrite(P,'4.bmp');
imwrite(DG,'5.bmp');
imwrite(DS,'6.bmp');
imwrite(DP,'7.bmp');
imwrite(GS,'8.bmp');
imwrite(GP,'9.bmp');
imwrite(SP,'10.bmp');
imwrite(DGS,'11.bmp');
imwrite(DGP,'12.bmp');
imwrite(GSP,'13.bmp');
imwrite(DSP,'14.bmp');
imwrite(DGSP,'15.bmp');


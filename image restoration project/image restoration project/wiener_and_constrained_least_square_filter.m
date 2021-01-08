I = imread('1.bmp');
I = double(I);
Idouble = im2double(I);
k = 0.0025;
[M,N]=size(I);
H = zeros(M,N);
for u=1:M
    for v=1:N
    H(u,v) = exp((-k)*(((u-M/2).^2-(v-N/2).^2).^5.6));
    end
end
mesh(abs(H));

% S=abs(ifft2(H));
% Sm=max(S(:));
% res = S/Sm;
% imshow(res);

wnr1 = deconvwnr(I,res);

Hj = conj(H);
Hj2 = 1./Hj;
H2 = Hj.*H;
sf = log10(abs(fftshift(fft2(rgb2gray(imread('raw.png'))))).^2);
sn = fspecial('gaussian',[300 300],0.2);

h = fspecial('motion',21,11);
s = var(Idouble(:));
n = 0.01;%gaussian noies varience = 0.01
nsr = n/s;

fr = (Hj./(H2+nsr)).*I ;
% fr = ((1./Hj).*(H2./(H2+nsr))).*I;
% fr = ((1/Hj).*(H2./(H2+sn./sf))).*I;

ps = [0 -1 0;-1 4 -1;0 -1 0;];
pf = fftshift(fft2(ps));
pj = conj(pf);
p2 = pj*pf;
gamma=1;
% fr= ((Hj)/(H2+gamma*p2)).*I;


S1=abs(ifft2(fr));
Sm1=max(S1(:));
res1 = S1/Sm1;
imshow(res1);
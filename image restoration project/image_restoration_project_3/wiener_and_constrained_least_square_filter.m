I = imread('1.bmp');
I = double(I);

k = 0.0025;
[M,N]=size(I);
H = zeros(M,N);
for u=1:M
    for v=1:N
    H(u,v) = exp((-k)*(((u-M/2).^2-(v-N/2).^2).^5.6));
    end
end

S=abs(ifft2(H));
Sm=max(S(:));
res = S/Sm;
imshow(res);

wnr1 = deconvwnr(I,res);

Hj = conj(H);
H2 = Hj.*H;

h = fspecial('motion',21,11);
s = var(Idouble(:));
n = 0.01;%gaussian noies varience = 0.01
nsr = n/s;

% fr = ((1/Hj).*(H2./(H2+nsr))).*I;

ps = [0 -1 0;-1 4 -1;0 -1 0;];
pf = fftshift(fft2(ps));
pj = conj(pf);
p2 = pj*pf;
gamma=1;
% fr= ((Hj)/(H2+gamma*p2)).*I;

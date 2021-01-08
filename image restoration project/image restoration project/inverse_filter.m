I = imread('raw_D.bmp');

F = fftshift(fft2(double(I)));
k = 0.0025;
[M,N]=size(F);
H = zeros(M,N);
for u=1:M
    for v=1:N
    H(u,v) = exp((-k)*(((u-M/2).^2-(v-N/2).^2).^5.6));
    end
end

Fprime = F./H;
Max = max(F,[],'all');
Min = min(F,[],'all');
for u=1:M
    for v=1:N
        if Fprime(u,v)>Max
            Fprime(u,v)=Max;
        elseif Fprime(u,v)<Min
            Fprime(u,v)=Min;
        end
    end
end

S=abs(ifft2(Fprime));
Sm=max(S(:));
res = S/Sm;
imshow(res);
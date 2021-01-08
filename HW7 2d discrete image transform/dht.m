for index=2:5
% index=1;
    rgb = imread(strcat('raw',num2str(index),'.png'));
    I = rgb2gray(rgb);
    
    %transform
    F = fftshift(fft2(I));  
    [M,N] = size(F);
    G = zeros(M,N);
    for m = 1:M
        for n = 1:N
            sum = 0;
            for i = 1:M
                for k = 1:N
                    sum = sum + F(i,k)*sqrt(2)*cos(((2*pi/N)*(i*m+k*n))-(pi/4));
                end
            end
            G(m,n) = (1/N)*sum;
        end
    end
    G1=abs(ifft2(G));
    G2=max(G1(:));
    G3=G1/G2;
    imwrite(G3,strcat('dht\res',num2str(index),'.png'));
    
    %inverse transform  
    [M,N] = size(G);
    Fr = zeros(M,N);
    for m = 1:M
        for n = 1:N
            sum = 0;
            for i = 1:M
                for k = 1:N
                    sum = sum + G(i,k)*sqrt(2)*cos(((2*pi/N)*(i*m+k*n))-(pi/4));
                end
            end
            Fr(m,n) = (1/N)*sum;
        end
    end
    fr1=abs(ifft2(Fr));
    fr2=max(fr1(:));
    fr3=fr1/fr2;
    
    imwrite(fr3,strcat('dht\res',num2str(index),'_inv.png'));
end
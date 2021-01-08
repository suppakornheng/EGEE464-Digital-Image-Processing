for index=1:5
    rgb = imread(strcat('raw',num2str(index),'.png'));
    I_temp = rgb2gray(rgb);
    I = double(I_temp);

    [M,N] = size(I);% N=M=256
    H = hadamard(N);% Hadamard matrix

    %transform
    G = fwht(I,N,'sequency');%fwht = Fast Walsh-Hadamard transform
    imwrite(G,strcat('rect\res',num2str(index),'.png'));
    
    %inverse transform
    Fr = ifwht(G,N,'sequency');
    uint8_Fr = uint8(Fr);
    imwrite(uint8_Fr,strcat('rect\res',num2str(index),'_inv.png'));
end
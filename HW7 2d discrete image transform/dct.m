for index=1:5
    rgb = imread(strcat('raw',num2str(index),'.png'));
    I = rgb2gray(rgb);
    
    %transform
    dct2_I = dct2(I);
    imwrite(dct2_I,strcat('dct\res',num2str(index),'.png'));
    
    %inverse transform
    idct2_I = idct2(dct2_I);
    uint8_idct2_I = uint8(idct2_I);
    imwrite(uint8_idct2_I,strcat('dct\res',num2str(index),'_inv.png'));
end
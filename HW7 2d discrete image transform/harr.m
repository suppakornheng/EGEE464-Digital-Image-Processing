for index=1:5
    rgb = imread(strcat('raw',num2str(index),'.png'));
    I = rgb2gray(rgb);
    
    %transform
    [a,h,v,d] = haart2(I,2);
    uint8_a = uint8(a);
    imwrite(uint8_a,strcat('harr\res',num2str(index),'.png'));
    
    %inverse transform
    invI = ihaart2(a,h,v,d,1);
    uint8_invI = uint8(invI);
    imwrite(uint8_invI,strcat('harr\res',num2str(index),'_inv.png'));
end
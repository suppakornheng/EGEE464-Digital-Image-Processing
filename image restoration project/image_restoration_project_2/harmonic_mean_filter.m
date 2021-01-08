I = zeros(300,300);
for i=1:15
    I = double(imread(strcat(num2str(i),'.bmp')));
    w33=ones(3,3);%window 3x3   
    w55=ones(5,5);%window 5x5
    %harmonic mean filter
    hI = I.^(-1);
    res_h33 = imfilter(hI, w33, 'replicate');
    res_h33 = numel(w33)./res_h33;
    res_h33 = uint8(res_h33);
    
    res_h55 = imfilter(hI, w55, 'replicate');
    res_h55 = numel(w55)./res_h55;
    res_h55 = uint8(res_h55);
    
    imwrite(res_h33,strcat('harmonic_mean_filter_result\h33_',num2str(i),'.bmp'));
    imwrite(res_h55,strcat('harmonic_mean_filter_result\h55_',num2str(i),'.bmp'));
end
I = zeros(300,300);
for i=1:15
    I = double(imread(strcat(num2str(i),'.bmp')));
    w33=ones(3,3);%window 3x3   
    w55=ones(5,5);%window 5x5
    %arithmetic mean filter
    a33 = 1/numel(w33)*w33;
    a55 = 1/numel(w55)*w55;
    res_a33 = uint8(imfilter(I,a33,'replicate'));
    res_a55 = uint8(imfilter(I,a55,'replicate'));
    imwrite(res_a33,strcat('arithmetic_mean_filter_result\a33_',num2str(i),'.bmp'));
    imwrite(res_a55,strcat('arithmetic_mean_filter_result\a55_',num2str(i),'.bmp'));
end
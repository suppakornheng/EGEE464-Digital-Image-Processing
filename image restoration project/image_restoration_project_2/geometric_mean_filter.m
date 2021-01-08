I = zeros(300,300);
for i=1:15
    I = double(imread(strcat(num2str(i),'.bmp')));
    w33=ones(3,3);%window 3x3   
    w55=ones(5,5);%window 5x5
    %geometric mean filter
    res_g33 = imfilter(log(I), w33,'replicate');%log(ab) = log(a) + log(b)
    res_g33 = exp(res_g33);
    res_g33 = uint8(res_g33 .^ (1/numel(w33)));

    res_g55 = imfilter(log(I), w55,'replicate');
    res_g55 = exp(res_g55);
    res_g55 = uint8(res_g55 .^ (1/numel(w55)));
    imwrite(res_g33,strcat('geometric_mean_filter_result\g33_',num2str(i),'.bmp'));
    imwrite(res_g55,strcat('geometric_mean_filter_result\g55_',num2str(i),'.bmp'));
end
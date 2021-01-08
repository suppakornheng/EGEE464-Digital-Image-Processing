I = zeros(300,300);
for i=1:15
    I = double(imread(strcat(num2str(i),'.bmp')));
    w33=ones(3,3);%window 3x3   
    w55=ones(5,5);%window 5x5
    %contraharmonic mean filter
    Qp=10;%positive q for pepper noise
    Qn=-10;%negative q for salt noise

    Iqp1_33 = I.^(Qp+1);
    res_c33_1 = imfilter(Iqp1_33,w33,'replicate');
    Iqp2_33 = I.^Qp;
    res_c33_2 = imfilter(Iqp2_33,w33,'replicate');
    res_c33_P = res_c33_1./res_c33_2;

    Iqn1_33 = I.^(Qn+1);
    res_c33_1 = imfilter(Iqn1_33,w33,'replicate');
    Iqn2_33 = I.^Qn;
    res_c33_2 = imfilter(Iqn2_33,w33,'replicate');
    res_c33_N = res_c33_1./res_c33_2;

    Iqp1_55 = I.^(Qp+1);
    res_c55_1 = imfilter(Iqp1_55,w55,'replicate');
    Iqp2_55 = I.^Qp;
    res_c55_2 = imfilter(Iqp2_55,w55,'replicate');
    res_c55_P = res_c55_1./res_c55_2;

    Iqn1_55 = I.^(Qn+1);
    res_c55_1 = imfilter(Iqn1_55,w55,'replicate');
    Iqn2_55 = I.^Qn;
    res_c55_2 = imfilter(Iqn2_55,w55,'replicate');
    res_c55_N = res_c55_1./res_c55_2;
    
    res_c33_N=uint8(res_c33_N);
    res_c33_P=uint8(res_c33_P);
    res_c55_N=uint8(res_c55_N);
    res_c55_P=uint8(res_c55_P);
    
    imwrite(res_c33_N,strcat('contraharmonic_mean_filter_result\c33_N_',num2str(i),'.bmp'));
    imwrite(res_c33_P,strcat('contraharmonic_mean_filter_result\c33_P_',num2str(i),'.bmp'));
    
    imwrite(res_c55_N,strcat('contraharmonic_mean_filter_result\c55_N_',num2str(i),'.bmp'));
    imwrite(res_c55_P,strcat('contraharmonic_mean_filter_result\c55_P_',num2str(i),'.bmp'));
end
I = imread('raw_p.bmp');
I = double(I);
w33=ones(3,3);%window 3x3
w55=ones(5,5);%window 5x5
%arithmetic mean filter
a33 = 1/numel(w33)*w33;
a55 = 1/numel(w55)*w55;
res_a33 = uint8(imfilter(I,a33,'replicate'));
res_a55 = uint8(imfilter(I,a55,'replicate'));

%geometric mean filter
res_g33 = imfilter(log(I), w33,'replicate');%log(ab) = log(a) + log(b)
res_g33 = exp(res_g33);
res_g33 = uint8(res_g33 .^ (1/numel(w33)));

res_g55 = imfilter(log(I), w55,'replicate');
res_g55 = exp(res_g55);
res_g55 = uint8(res_g55 .^ (1/numel(w55)));

%harmonic mean filter
hI = I.^(-1);
res_h33 = imfilter(hI, w33, 'replicate');
res_h33 = numel(w33)./res_h33;

res_h55 = imfilter(hI, w55, 'replicate');
res_h55 = numel(w55)./res_h55;


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



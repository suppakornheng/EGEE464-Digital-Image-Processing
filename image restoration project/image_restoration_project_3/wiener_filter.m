I = zeros(300,300);
fr = zeros(300,300);
for i=1:15
%     i=2;
    I = imread(strcat(num2str(i),'.bmp'));
%     I = imread('a33_6.bmp');
    Idouble = im2double(I);
    h = fspecial('motion',21,11);
    s = var(Idouble(:));
    n = 0.01;%gaussian noies varience = 0.01
    nsr = n/s;
    if i==1
        fr = deconvwnr(I,h);
    else
        fr = deconvwnr(I,h,nsr);
    end
%     imshow(fr);
    imwrite(fr,strcat('wiener_filter_result\w',num2str(i),'.bmp'));
end
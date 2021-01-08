I = zeros(300,300);
fr = zeros(300,300);
for i=1:15
    I = imread(strcat(num2str(i),'.bmp'));
    h = fspecial('motion',21,11);
    n = 0.01;%gaussian noies varience = 0.01
    NP = n*numel(I);%NP= noise power
    if i==1
        fr = deconvreg(I,h);
    else
       fr = deconvreg(I,h,NP);
    end
%     imshow(fr);
    imwrite(fr,strcat('cls_filter_result\cls',num2str(i),'.bmp'));
end
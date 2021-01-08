g = zeros(300,300);
fr = zeros(300,300);
for i=1:15
    g = imread(strcat(num2str(i),'.bmp'));
    h = fspecial('motion',21,11);
    fr = deconvblind(g,h);
    imwrite(fr,strcat('inverse_filter_result\inv',num2str(i),'.bmp'));
end
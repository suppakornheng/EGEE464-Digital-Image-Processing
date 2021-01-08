I=imread('C:\Users\Suppakorn\Documents\view_image.png');
%choose 3 main color
w = [119 208 234];%RGB color for water
t = [245 238 233];%RGB color for sand
s = [181 214 255];%RGB color for sky
s2 = [139 190 255];%RGB color for sky2
b = [185 175 182];%RGB color for bridge
h = [141 41 19];%RGB color for house

I_d = double(I);
[m,n,k]= size(I_d); 
d = [0 0 0 0 0 0 ];%intiate distance array
z = zeros(m,n,k);
for i = 1:m
    for j = 1:n
        d(1) = sqrt((I_d(i,j,1)-w(1)).^2+(I_d(i,j,2)-w(2)).^2+(I_d(i,j,3)-w(3)).^2);%distance between color of pixel and water
        d(2) = sqrt((I_d(i,j,1)-t(1)).^2+(I_d(i,j,2)-t(2)).^2+(I_d(i,j,3)-t(3)).^2);%distance between color of pixel and tree
        d(3) = sqrt((I_d(i,j,1)-s(1)).^2+(I_d(i,j,2)-s(2)).^2+(I_d(i,j,3)-s(3)).^2);%distance between color of pixel and sky
        d(4) = sqrt((I_d(i,j,1)-s2(1)).^2+(I_d(i,j,2)-s2(2)).^2+(I_d(i,j,3)-s2(3)).^2);%distance between color of pixel and sky2
        d(5) = sqrt((I_d(i,j,1)-b(1)).^2+(I_d(i,j,2)-b(2)).^2+(I_d(i,j,3)-b(3)).^2);%distance between color of pixel and building
        d(6) = sqrt((I_d(i,j,1)-h(1)).^2+(I_d(i,j,2)-h(2)).^2+(I_d(i,j,3)-h(3)).^2);%distance between color of pixel and building
        min_d = min(d);
        if min_d == d(1)
%             z(i,j,:) =  w;
            z(i,j,:) =  [109 171 222];%new color for water 
        elseif min_d == d(2)
%             z(i,j,:) =  t;
            z(i,j,:) =  [241 161 47];%new color for sand 
        elseif min_d == d(3) || min_d == d(4)
%             z(i,j,:) =  s;
            z(i,j,:) =  [180 237 232];%new color for sky
        elseif min_d == d(5)
%             z(i,j,:) =  b;
            z(i,j,:) =  [254 189 255];%new color for bridge 
        else
%             z(i,j,:) =  h;
            z(i,j,:) =  [229 62 247];%new color for house
        end    
    end
end
Z=uint8(z);

subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(Z);
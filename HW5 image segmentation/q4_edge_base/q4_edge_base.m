g=imread('C:\Users\Suppakorn\Documents\raw.png');
[m,n]= size(g); 
% subplot(1,3,1);
% imshow(g);

%gradient - code by myself
% gr = zeros(m,n);
% g_c = double(g);
% g_d = padarray(g_c,[1 1],0,'both');
% for i=2:m+1
%     for j=2:n+1
%         gr(i,j)=sqrt((g_d(i+1,j)-g_d(i,j)).^2+(g_d(i,j+1)-g_d(i,j)).^2);
%     end
% end

%gradient - matlab ready used
[Gmag,Gdir] = imgradient(g);
Gmag_uint8=uint8(Gmag);
G_thres=zeros(m,n);
thres=100;
for i=1:m
    for j=1:n
        if(Gmag(i,j)>thres)
            G_thres(i,j)=255;    
        else
            G_thres(i,j)=0;    
        end
    end
end

figure(1);
subplot(1,2,1);
imshow(Gmag_uint8);
title('Gradient Image');
subplot(1,2,2);
imshow(G_thres);
title('Gradient threshold=100');



%lapacian
mask = [0 -1 0; -1 4 -1; 0 -1 0];
la_raw = conv2(g, mask);
la_thres=zeros(m,n);
thres=45;
for i=1:m
    for j=1:n
        if(la_raw(i,j)>thres)
            la_thres(i,j)=255;    
        else
            la_thres(i,j)=0;    
        end
    end
end

figure(2)
subplot(1,2,1);
imshow(la_raw);
title('lapacian image');
subplot(1,2,2);
imshow(la_thres)
title('lapacian threshold=45');
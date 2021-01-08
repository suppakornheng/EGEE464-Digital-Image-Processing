rgb=imread('C:\Users\Suppakorn\Documents\raw5.jpg');
g = rgb2gray(rgb);

%%%%%%  this section is used for MRI image name raw1, raw2, raw3 %%%%%%%
% Mx = max(g, [], 'all');
% Mn = min(g, [], 'all');
%step = (Mx-Mn)/16;%use this value for image name raw1, raw2 
% step = (Mx-Mn)/8;% use this for image raw 3
% [m,n,k]= size(rgb); 
% z = zeros(m,n,k);  
% for i = 1:m
%     for j = 1:n
%         if g(i,j)>=Mn+7*step
%               z(i,j,:)=[255,255,255];%white
%         elseif g(i,j)>=Mn+6*step
%               z(i,j,:)=[0,255,0];%green
%         elseif g(i,j)>=Mn+5*step
%               z(i,j,:)=[255,255,0];%yellow
%         elseif g(i,j)>=Mn+4*step
%               z(i,j,:)=[255,0,0];%red
%         elseif g(i,j)>=Mn+3*step
%               z(i,j,:)=[0,255,255];%cyan
%         elseif g(i,j)>=Mn+2*step
%               z(i,j,:)=[0,0,255];%blue
%         elseif g(i,j)>=Mn+step
%               z(i,j,:)=[255,0,255];%magenta
%         else
%               z(i,j,:)=[0,0,0];%black
%         end
%     end
% end
% 
% figure(1);
% subplot(1,2,1);
% imshow(g);
% subplot(1,2,2);
% imshow(z);
%%%%%%  end section  %%%%%%%


%%% this section is used for temperature slicing (image name raw4, raw5)%%
figure(1)
ax1 = subplot(1,2,1);
imshow(g);
colormap(ax1,gray)
ax2 = subplot(1,2,2);
imshow(g);
colormap(ax2,hot);%this is a ready-made code for intensity slicing from matlab
%%% this section is used for temperature slicing (image name raw4, raw5)%%
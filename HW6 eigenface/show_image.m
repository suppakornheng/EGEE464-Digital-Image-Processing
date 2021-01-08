%data_set_images
figure(1);
for i=1:20
    subplot(4,5,i);
    imshow(reshape(loaded_Image(:,i),112,92));
end

%eigen_face
figure(2);
subplot(4,5,1);
imshow(reshape(mean_value,112,92));
title('mean value');
for i=1:19
    ax=subplot(4,5,i+1);
    s=mesh(reshape((V(:,i)),112,92)); 
    colormap(ax,gray);
    view(0,90);
    direction=[0 0 1];
    rotate(s,direction,180);
end
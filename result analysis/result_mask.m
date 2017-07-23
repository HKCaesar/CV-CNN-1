%*****************************************************************
%Description: classification reslut overlaid ground truth area 
%input: ImageRGB from test_imaging.m; label
%*****************************************************************
load label_4_same.mat;
label = label_4_same;   
load ImageRGB_oo6.mat;

ImageRGB_oo = ImageRGB_oo6;
[row,col] = size(class_img_6);
mask = zeros(row,col);
for i = 1:row
    for j = 1:col
        if (label(i,j) ~= 0)
            mask(i,j) = 1;
        else 
            mask(i,j) = 0;
        end
    end
end

R = mask.*ImageRGB_oo(:,:,1);
G = mask.*ImageRGB_oo(:,:,2);
B = mask.*ImageRGB_oo(:,:,3);

ImageRGB(:,:,1) = R;
ImageRGB(:,:,2) = G;
ImageRGB(:,:,3) = B;
figure
imshow(ImageRGB);


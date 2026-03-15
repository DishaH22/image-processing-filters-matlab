img=imread('Test_image.jpg');
img=rgb2gray(img);

im_med=medfilt2(img);

subplot(1,2,1)
imshow(img)
title('Original Image')

subplot(1,2,2)
imshow(im_med)
title('Median Filtered Image')

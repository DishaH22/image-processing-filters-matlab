img=imread('Test_image.jpg');
imgd=im2double(img);

f_avg=fspecial('average',10);
im_avg=imfilter(img,f_avg);

imshow(im_avg)
title('Average Filter')

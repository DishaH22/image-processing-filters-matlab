function pushbutton1_Callback(hObject, eventdata, handles)

img=imread('Test_image.jpg');
imgd=im2double(img);

f=ones(3,3)/10;

img1=imfilter(imgd,f);

subplot(121);imshow(img);
title('Original Image');

subplot(122);imshow(img1);
title('Filtered Image');

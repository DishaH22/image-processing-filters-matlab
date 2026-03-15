img=imread('Test_image.jpg');

f_gaus=fspecial('gaussian',10,0.7);

im_gaus= imfilter(img,f_gaus);

imshow(im_gaus)

title('Gaussian Filter')

I=imread('Test_image.jpg');
Img= rgb2gray(I);

[m,n] = size(Img);

output = zeros(m,n);

for i=1:m
 for j=1:n

 rmin= max(1,i-1);
 rmax= min(m,i+1);

 cmin= max(1,j-1);
 cmax= min(n,j+1);

 temp= Img(rmin:rmax,cmin:cmax);

 output(i,j) = mean(temp(:));

 end
end

imshow(output)
title('Mean Filtered Image')

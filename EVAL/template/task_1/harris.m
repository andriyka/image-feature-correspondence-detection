function [x,y]=harris(img,sigd,sigi,thresh)
%computes the response of Harris function for each pixel of input image
response = harris_response(img, sigd, sigi);
maximg = nonmaxsup2d(response, thresh);
[y, x] = find(maximg);
x = x'-1;
y = y'-1;
end


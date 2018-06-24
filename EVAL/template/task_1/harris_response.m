function resp=harris_response(img, sigd, sigi)
%computes the response of Harris function for each pixel of input image %   Detailed explanation goes here
alpha = 0.04;
xd = (-ceil(3.0*sigd):ceil(3.0*sigd));
xi = (-ceil(3.0*sigi):ceil(3.0*sigi));

Gd = gauss(xd, sigd);
Gi = gauss(xi, sigi);
Gd = Gd./sum(Gd);
Gi = Gi./sum(Gi);

Gd_smooth = conv2(Gd, Gd, img, 'same');

dx = conv2(1, [1,0, -1]/2, Gd_smooth, 'same');
dy = conv2([1,0, -1]/2, 1, Gd_smooth, 'same');

dx2 = conv2(Gi, Gi, dx.*dx, 'same');
dy2 = conv2(Gi, Gi, dy.*dy, 'same');
dxy = conv2(Gi, Gi, dx.*dy, 'same');
trace = alpha*(dx2+dy2);

resp = (dx2.*dy2-dxy.^2)-trace.^2; 
end



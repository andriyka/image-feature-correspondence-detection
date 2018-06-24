function [hesian_resp,sigma]=sshessian_response(img)
%  compute Hessian response for normalized derivation of Gaussian
step = 1.1;
levels = 40;
[ss, sigma] = scalespace(img, levels, step);
hesian_resp = zeros(size(ss));
for i = 1:levels
    dx = conv2(1, [1,0, -1]/2, ss(:,:,i), 'same');

    dxx = conv2(1, [1, -2, 1], ss(:,:,i), 'same');
    dxy = conv2([1,0, -1]/2, 1, dx, 'same');
    dyy = conv2([1, -2, 1], 1, ss(:,:,i), 'same');
    hesian_resp(:,:,i) = sigma(i)^4*(dxx.*dyy - dxy.^2);
end
end


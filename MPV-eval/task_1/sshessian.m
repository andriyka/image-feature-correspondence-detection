function [x,y,s]=sshessian(img, thresh)
%detector of Hessian maxima with automatic scale estimation
[resp, sigs] = sshessian_response(img);
maximg=nonmaxsup3d(resp, thresh);
[y, x, sig_loc]=ind2sub(size(maximg), find(maximg)); 
x=x'-1;
y=y'-1;
s = sigs(sig_loc);
end
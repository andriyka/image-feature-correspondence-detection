function [ss,sigma]=scalespace(img,levels,step)
% returns a 3D scale-space (matrix HxWxL, where H is hight, W is width and L is number of levels)
sigma = step.^(0:levels - 1);    
[height, weight] = size(img);
ss=zeros([height, weight, levels]);
ss(:,:,1)=img;
for i = 2:levels
    x = (-ceil(3.0*sigma(i)):ceil(3.0*sigma(i)));
    G = gauss(x, sigma(i));
    G = G./sum(G); 
    ss(:,:, i) = conv2(G, G, img, 'same');
end
end
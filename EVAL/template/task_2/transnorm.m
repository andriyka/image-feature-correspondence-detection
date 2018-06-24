function pts=transnorm(img,x,y,s,opt)
% affine transformation consolidation function 
pts=affnorm(img,x,y,ones(1, length(x))*s,zeros(1, length(x)),...
zeros(1, length(x)),ones(1, length(x))*s,opt);
end


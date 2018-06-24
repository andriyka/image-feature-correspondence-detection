function pts=simnorm(img,x,y,s,opt)
    pts=affnorm(img,x,y,s,zeros(1, length(x)),zeros(1, length(x)),s,opt);
end


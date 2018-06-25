function [Hbest,inl]=ransac_h(u,threshold,confidence)
%  estimates the fundamental matrix F* and a set of inliers inl
dim = 4;
points_arr_size = size(u, 2); num_samples = inf;inl_count = 0;  
Hbest = zeros(3,3);
inl = zeros(1, points_arr_size);
count = 1;
while count < num_samples
    Homo = u2H(u(:, sample(dim, points_arr_size)));
    if isempty(Homo)
       continue;
    end
    hdists = hdist(Homo, u);
   if (inl_count < sum(hdists < threshold * threshold))
     Hbest = Homo;
    inl = hdists < threshold * threshold;
    inl_count = sum(inl);       
    num_samples = nsamples(inl_count, points_arr_size, dim, confidence);
   end
    count = count+1;
end


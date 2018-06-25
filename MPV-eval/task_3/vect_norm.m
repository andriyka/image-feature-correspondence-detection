function norm = vect_norm(vect)
if (size(vect,1)==3)
    vect = vect(1:2,:) ./ ([1;1] * vect(3,:)); 
end
vect = vect - mean(vect')'*ones(1,size(vect,2));
sq_sum = sqrt(sum(vect.*vect));
r = mean(sq_sum)/sqrt(2);
norm  = diag([1/r 1/r 1]);
norm(1:2,3) = -mean(vect')'/r;


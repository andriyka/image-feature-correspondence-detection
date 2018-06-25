function H = u2H(u) 
% gets a matrix of 4 corresponding pairs of points in homogeneou coordinates and computes the homography 
u1 = [vect_norm(u(4:6,:))* u(4:6,:); vect_norm(u(1:3,:))*u(1:3,:)];
M1= u1(4:6,:)' .* (u1(3,:)' * [1,1,1]);
M1(:,4:6)=0;
M1(:,7:9)=-u1(4:6,:)'.* (u1(1,:)' * [1,1,1]);
M2(:,4:6) =u1(4:6,:)'.* (u1(3,:)' * [1,1,1]);
M2(:,1:3) = 0;
M2(:,7:9) =-u1(4:6,:)' .* (u1(2,:)' * [1,1,1]);
M = [M1; M2];

[~,~,V] = svd(M);
H = reshape(V(:,9),3,3)';
H = vect_norm(u(4:6,:))\(H*vect_norm(u(1:3,:)));





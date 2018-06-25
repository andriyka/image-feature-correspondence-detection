function dist=hdist(H,u)
r = u(4:6, :);   
q = H*u(1:3, :);
q(1,:) = q(1,:)./q(3,:);
q(2,:) = q(2,:)./q(3,:);   
q(3,:) = q(3,:)./q(3,:);
s = q - r;
dist = sum(s.^2);
end
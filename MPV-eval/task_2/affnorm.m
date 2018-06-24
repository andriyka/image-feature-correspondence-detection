function pts=affnorm(img,x,y,a11,a12,a21,a22,opt)
% partial affine transformation
pts = struct();
for i = 1:length(x)
    M=[a11(i),a12(i) x(i) ; 
           a21(i),a22(i) y(i) ; 
           0,     0,     1];
      patch = affinetr(img, M, opt.ps, opt.ext);
      ang = -dom_orientation(patch);
      R_matr = [ cos(ang) sin(ang) ; 
           -sin(ang) cos(ang)];
       
      M(1:2,1:2,:)=M(1:2,1:2,:)*R_matr;
      pts(i).x=x(i);
      pts(i).y=y(i);
      pts(i).a11=M(1,1);
      pts(i).a12=M(1,2);
      pts(i).a21=M(2,1);
      pts(i).a22=M(2,2);
      pts(i).patch=affinetr(img, M, opt.ps, opt.ext);
end
end
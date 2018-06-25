function corr=match(pts1, pts2, par)
% finds correspondences between points pts1 and pts2 with method specified in the par structure
   eps = 0.8;
   thresh = par.threshold*par.threshold;
   M=zeros(numel(pts1),numel(pts2));
   for i=1:numel(pts1)
      M(i,:) = sum((repmat(pts1(i).desc, 1, numel(pts2)) - [pts2.desc]).^2);
   end
   switch (par.method)
     case 'mutual'
       [m1,i1] = min(M, [], 2); 
       [~,i2] = min(M, [], 1);
       corr = zeros(2, min(numel(pts1), numel(pts2)));
       count_mut = 0;
       for i=1:numel(pts1)
          if (i2(i1(i))==i)
              if(m1(i)<=thresh)
                corr(:,count_mut+1) = [i; i1(i)];
                count_mut=count_mut+1;
              end
          end
       end
       corr(:,count_mut+1:end)=[];
     case 'stable'
       count_st=0;
       for i=1:min(numel(pts1),numel(pts2))
          [v, idx]=min(M(:));
          [y, x]=ind2sub(size(M),idx);
          if (v>thresh)          
             break;
          end
          corr(:,count_st+1)= [y;x];
          count_st=count_st+1; 
          M(:,x)=inf;
          M(y,:)=inf; 
       end
       corr(:,count_st+1:end)=[];
     case 'sclosest'       
       count_scl=0;
       for i=1:numel(pts1)
          [d, o]=sort(M(i,:));
          if (d(1)/d(2) < eps^2)
             corr(:,count_scl+1) = [i;o(1)];
             count_scl=count_scl+1;             
          end
       end
       corr(:,count_scl+1:end)=[];
    end

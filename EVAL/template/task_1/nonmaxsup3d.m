function extrema=nonmaxsup3d(response, threshold)
   
   extrema=logical(zeros(size(response)));
   extrema(2:end-1,2:end-1,2:end-1) =... 
       response(2:end-1,2:end-1,2:end-1) > threshold & ...
       response(2:end-1,2:end-1,2:end-1) > response(1:end-2,2:end-1,2:end-1) & ...
       response(2:end-1,2:end-1,2:end-1) > response(1:end-2,1:end-2,2:end-1) & ...
       response(2:end-1,2:end-1,2:end-1) > response(2:end-1,1:end-2,2:end-1) & ...
       response(2:end-1,2:end-1,2:end-1) > response(3:end  ,1:end-2,2:end-1) & ...
       response(2:end-1,2:end-1,2:end-1) > response(3:end  ,2:end-1,2:end-1) & ...
       response(2:end-1,2:end-1,2:end-1) > response(3:end  ,3:end  ,2:end-1) & ...
       response(2:end-1,2:end-1,2:end-1) > response(2:end-1,3:end  ,2:end-1) & ...
       response(2:end-1,2:end-1,2:end-1) > response(1:end-2,3:end  ,2:end-1) & ...
       response(2:end-1,2:end-1,2:end-1) > response(1:end-2,1:end-2,1:end-2) & ...
       response(2:end-1,2:end-1,2:end-1) > response(1:end-2,2:end-1,1:end-2) & ...
       response(2:end-1,2:end-1,2:end-1) > response(1:end-2,3:end  ,1:end-2) & ...
       response(2:end-1,2:end-1,2:end-1) > response(2:end-1,1:end-2,1:end-2) & ...
       response(2:end-1,2:end-1,2:end-1) > response(2:end-1,2:end-1,1:end-2) & ...
       response(2:end-1,2:end-1,2:end-1) > response(2:end-1,3:end  ,1:end-2) & ...
       response(2:end-1,2:end-1,2:end-1) > response(3:end  ,1:end-2,1:end-2) & ...
       response(2:end-1,2:end-1,2:end-1) > response(3:end  ,2:end-1,1:end-2) & ...
       response(2:end-1,2:end-1,2:end-1) > response(3:end  ,3:end  ,1:end-2) & ...
       response(2:end-1,2:end-1,2:end-1) > response(1:end-2,1:end-2,3:end  ) & ...
       response(2:end-1,2:end-1,2:end-1) > response(1:end-2,2:end-1,3:end  ) & ...
       response(2:end-1,2:end-1,2:end-1) > response(1:end-2,3:end  ,3:end  ) & ...
       response(2:end-1,2:end-1,2:end-1) > response(2:end-1,1:end-2,3:end  ) & ...
       response(2:end-1,2:end-1,2:end-1) > response(2:end-1,2:end-1,3:end  ) & ...
       response(2:end-1,2:end-1,2:end-1) > response(2:end-1,3:end  ,3:end  ) & ...
       response(2:end-1,2:end-1,2:end-1) > response(3:end  ,1:end-2,3:end  ) & ...
       response(2:end-1,2:end-1,2:end-1) > response(3:end  ,2:end-1,3:end  ) & ...
       response(2:end-1,2:end-1,2:end-1) > response(3:end  ,3:end  ,3:end  );
   
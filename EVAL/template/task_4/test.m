%% visualise results of Finding correspondences chapter, load images and data first

imgs = cell(3,5);
dets = cell(3,5);
tc   = cell(1,5);
res  = cell(1,5);

student_obj_offset  = exist('obj0_view1.mat', 'file')>0;
student_view_offset = exist('obj1_view0.mat', 'file')>0;
for obj=1:3
   try
      for view=1:5
         fname = sprintf('obj%d_view%d.mat', obj-student_obj_offset, view-student_view_offset);
         im_fname = sprintf('obj%d_view%d.jpg', obj-student_view_offset, view-student_view_offset);
	 im = imread(im_fname);
	 if (size(im,3)>1)
	         imgs{obj,view} = rgb2gray(im);
	 else
	         imgs{obj,view} = im;
         end;
         dets{obj,view} = load(fname);
      end;
      tc{obj} = load(sprintf('obj%d_tc.mat', obj-student_obj_offset));
      res{obj} = load(sprintf('obj%d_results.mat', obj-student_obj_offset));
   catch
      fprintf('Missing results?\n');
      fprintf('ERR: %s\n', lasterr);
   end;
end;

%% detections first object

dets{1,1}.detpar
for view=1:5, figure; ims(imgs{1,view}); showpts(dets{1,view}.pts); end;

%% detections second object

dets{2,1}.detpar
for view=1:5, figure; ims(imgs{2,view}); showpts(dets{2,view}.pts); end;

%% detections third object

dets{3,1}.detpar
for view=1:5, figure; ims(imgs{3,view}); showpts(dets{3,view}.pts); end;

%% correspondences and inliers to homography on first object
res{1}.H{1,2}
for view1=1:5
   for view2=view1+1:5
      u   = corr2u(dets{1,view1}.pts, dets{1,view2}.pts, tc{1}.TC{view1, view2});
      inl = res{1}.inlH{view1,view2}>0;
      showcorrs(imgs{1,view1}, imgs{1,view2}, u, inl);
   end;
end;

%% correspondences and inliers to homography on second object
res{2}.H{1,2}
for view1=1:5
   for view2=view1+1:5
      u   = corr2u(dets{2,view1}.pts, dets{2,view2}.pts, tc{2}.TC{view1, view2});
      inl = res{2}.inlH{view1,view2}>0;
      showcorrs(imgs{2,view1}, imgs{2,view2}, u, inl);
   end;
end;

%% correspondences and inliers to homography on third object
res{3}.H{1,2}
for view1=1:5
   for view2=view1+1:5
      u   = corr2u(dets{3,view1}.pts, dets{3,view2}.pts, tc{3}.TC{view1, view2});
      inl = res{3}.inlH{view1,view2}>0;
      showcorrs(imgs{3,view1}, imgs{3,view2}, u, inl);
   end;
end;

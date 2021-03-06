function [bwim, skym] = getnva(skymask,im)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function makes a binary image containing non-vegetative areas
% pass in the masks created from pca and pca2, and this should get sky vs
% not sky(both are still non-vegetative).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s = size(skymask,1)*size(skymask,2);
skym = bwareaopen(skymask,ceil(s/200));
im = majorityfilter(im + 1,3) - 1;
filled = ~(bwareaopen(im,ceil(s/200)));
[r,c] = find(skym & ~filled);
bwim = ~(imfill(filled,[r,c]));
imagesc(~filled & ~skym & ~bwim);
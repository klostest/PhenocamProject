function newm = majorityfilter(img, clusters, amt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%takes an image of classifications and smooths based on the majority within
%a neighborhood amt.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%img = imread(img);
tx = size(img,1);
ty = size(img,2);

newm = zeros(tx,ty);

for i = 1:tx;
    for j = 1:ty;
        m = zeros(clusters,1);
        for dx = -amt:amt;
            for dy= -amt:amt;
                if abs(tx/2 - (i + dx) + .5) < tx/2 && abs(ty/2 + .5 - (j + dy)) < ty/2;
                    m(img(i + dx, j + dy),1) = m(img(i + dx, j + dy), 1) + 1;
                end
            end
        end
        max = 1;
        for it = 1 : clusters;
            if m(it, 1) > m(max,1);
                max = it;
            end
        end
        newm(i,j) = max;
    end
end
end
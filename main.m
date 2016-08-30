%% Finding the widths of the ring
% clear all, clc

% read image
a = imread('in.png');

% convert to b/w
bw = logical(a);

% extract properties
stats = regionprops(bw);

% save centroid if extraction successful
if(length(stats)==1)
    disp('Ring detected correctly.')
    center = round(stats.Centroid);
else
    disp('Rind not detected. Exiting...')
    return
end

% use intersection point detection function with 4 segments
[points] = be_intersection_points(bw, [center(2), center(1)], 4);

% the distances for each of the segments
dist1 = pdist2(points{1}(1,:),points{1}(2,:));
dist2 = pdist2(points{2}(1,:),points{2}(2,:));
dist3 = pdist2(points{3}(1,:),points{3}(2,:));
dist4 = pdist2(points{4}(1,:),points{4}(2,:));

% print the result
disp(['Distance 1: ' num2str(dist1) ' pixels']);
disp(['Distance 2: ' num2str(dist2) ' pixels']);
disp(['Distance 3: ' num2str(dist3) ' pixels']);
disp(['Distance 4: ' num2str(dist4) ' pixels']);
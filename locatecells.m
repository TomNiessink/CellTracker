function [proptable] = locatecells (frame_segmented,v)
% This function performs blobdetection on the segmented video

for i=1:v.NumFrames
    % This is a MATLAB imtoolbox function which recognizes blobs
    CC=bwconncomp(frame_segmented(:,:,i)); 
    props = regionprops(CC,'PixelList', 'Centroid', 'Area'); % This is the saved data
    props=struct2cell(props); % Some data restructuring 
    proptable{i}=props; % Add to table
    
end
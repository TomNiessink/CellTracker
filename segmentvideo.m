function [frame_segmented]=segmentvideo(v,treshold,filtersize)
%This function segments a complete video v based on a certain treshold and
%filtersize.

% Preallocate data space for faster computation
frame_segmented=zeros(v.Height,v.Width,v.NumFrames);

for i=1:v.NumFrames % Perfom this for the whole video
    frame = v.read(i);
    segmentedimage = segmentimage(frame,treshold,filtersize); % Segment image
    
    frame_segmented(:,:,i) = segmentedimage;    % Save segmented frame
    %imshow(frame_segmented(:,:,i),[0 1])       % Unmute to see video
end
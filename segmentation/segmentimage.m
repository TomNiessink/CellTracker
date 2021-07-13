function frame_segmented=segmentimage(frame,treshold,filtersize)

image=imsharpen(frame);
MASK = image(:,:)>treshold;
segmentedimage = image;
segmentedimage(~MASK) = 0;
segmentedimage(MASK) = 1;
SE = strel('disk',filtersize);
frame_segmented = imerode(segmentedimage,SE);

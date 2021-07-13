function [scoretable, matches] = findmatch(proptable,frameindex,celletje)
% This function attempts to find a matching cell in a neighbouring frame
% The input is the property table of cells in each frame, the frame index
% And the cell to be matched

% This loop evaluates how wel certain cells match 
for k = 1:numel(proptable{frameindex+1}(1,:))
       sizeindex(k) = (proptable{frameindex+1}{1,k})>3; %&& (proptable{frameindex+1}{1,k})<200;     % A cell should be at least this size
       scaleindex(k) = abs((proptable{frameindex+1}{1,k}-celletje{1}))<celletje{1}*0.5; % And at most 50% smaller or larger than the previous cell
       centroidindex(k) = abs(min(proptable{frameindex+1}{2,k})-min(celletje{2,1}))<min(celletje{2,1})*0.2; % The centroid should match no less then 20%
end

% If there are any cells in the next frame
if numel(proptable{frameindex+1}(1,:)) > 0
    scoretable=sizeindex+centroidindex+scaleindex;      %Calculate a score for each cell
    scoretable(scoretable<3)=0;                         %Each not-perfect score is not a fit
    matches = sum(scoretable)/3;                        %Evaluate the number of matches

else                                                    %If there are no cells found, return this
    scoretable=0;
    matches=0;
    
end


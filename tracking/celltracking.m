function [Trajectory] = celltracking(proptable,v)
% This function performs the celltracking part of the script

trajcount=1;
Trajectory=zeros(2,v.NumFrames,2);



while find(~cellfun(@isempty,proptable),1)>0 
% Find the first frame with cells
frameindex = find(~cellfun(@isempty,proptable),1);

% For each cell in the found frame
for cellno=1:numel(proptable{frameindex})/3

celletje= proptable{frameindex}(:,cellno);  % Take the cell
frameindex_I=frameindex;                    % Hop back to the frame the cell was found in

if celletje{1}>25                           % If the cell has a size larger then 25 px^2
trajcount=trajcount+1;                      % There will be a new trajectory

   while frameindex_I<v.NumFrames
    tempcell=cell2mat(celletje(3));         % Temporary data restructuring
    Trajectory(1,frameindex_I,trajcount)=tempcell(1,1); % Add cell location to trajectory         
    Trajectory(2,frameindex_I,trajcount)=tempcell(1,2);
   
    
    % Use function 'findmatch' to find which cells match the current cell
    [scoretable,matches]=findmatch(proptable,frameindex_I,celletje);    

       
    if matches==1 % If there is no more or less than 1 match, we have matched the cell
       
       celletje=proptable{frameindex_I+1}(:,(scoretable==3));   % Thus we can jump to this next cell
       
       % As the cell is matched, we can remove it from the database to make
       % sure we don't match it again
       proptable{frameindex_I+1}(:,(scoretable==3))=[];         
       frameindex_I = frameindex_I+1;   % Then we can jump to the next frame
       clear scoretable  % Just making sure 

    else
       
       frameindex_I=1E23;   % If we don't find a match or multiple, we have to break the loop
    end
       
   
    end
else 
    
end


end

proptable{frameindex}=[];  % When finished, we can delete the cells from the database and move to the next frame with cells

end

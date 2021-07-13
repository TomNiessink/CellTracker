function [Trajectory] = cleantrajectory(Trajectory,minlength,v)
% This function cleans the Trajectory database of each trajectory
% With fewer elements than specified by variable minlength

goclean = 1;        % For the while loop
trajno = 1;         % To find where we are


while goclean == true
    if nnz(Trajectory(1,:,trajno))<minlength % If the number of nonzero elements in the Trajectory database is smaller than specified
        Trajectory(:,:,trajno)=[];  % Then we delete this trajectory
        trajno=1;       % And start the whole iteration again, yes I know this probably not the fastest way to do this
    else
        trajno=trajno+1;    % If we have more elements, we can jump to the next trajectory
    end
    
    if trajno > sum(size(Trajectory))-2-v.NumFrames  % If we run out of trajectories to clean, we can break the loop
        goclean = 0;
    end
        
end

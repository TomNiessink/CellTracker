function [vy_px] = calculatevy_px(Trajectory)
% This function calculates the velocity towards the magnet in pixels/frame


[~,~,trajcount]=size(Trajectory);

Traj_num=1;
VY_per_Traj=zeros(trajcount,1);



while Traj_num <trajcount+1 % For each trajectory in the database
    
Traj_temp = Trajectory(2,:,Traj_num);   % Take one trajectory   
Traj_length = cumsum(nnz(Traj_temp));   % Calculate length in frames
firstloc = find(Traj_temp,1,'first');   % Find the first value
lastloc = find(Traj_temp,1,'last');     % Find the last value
VY_per_Traj(Traj_num)=(Traj_temp(lastloc)-Traj_temp(firstloc))/Traj_length; % The velocity is the traveled distance over the number of frames
Traj_num=Traj_num+1;

end

vy_px=VY_per_Traj;                      % Reflect data back
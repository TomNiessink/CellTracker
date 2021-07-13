function [] = plottrajectories(Trajectory)
% Plots trajectories 

[~,~,trajcount]=size(Trajectory);

figure(14)
hold on
for i = 1:trajcount
    plot(Trajectory(1,:,i),Trajectory(2,:,i),'o')

end
set(gca, 'YDir','reverse')
ylabel('Y (pixels)')
xlabel('X (pixels)')
title('Trajectories of filmed cells')
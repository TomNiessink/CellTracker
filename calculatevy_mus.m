function [VY_mus] = calculatevy_mus(VY_per_Traj,fps,px_to_mu)
% From Px/frame to mu/s


spf = 1/fps;
VY_mus = VY_per_Traj*px_to_mu/(5*spf);



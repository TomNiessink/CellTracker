function [murp,mmax]=calculate_mmax(mus_per_Traj,R,eta,grH2,H)
% From mu/s to murp

[trajcount,~]=size(mus_per_Traj);

for i = 1:trajcount
    % Formulas are defined in the thesis
murp(i) = (-(mus_per_Traj(i)^-1*(-(R^2)/(3*eta)*grH2)-2))/(1-(mus_per_Traj(i)^-1*(-(R^2)/(3*eta)*grH2)));
mmax(i) = (murp(i)-1)*(4/3)*R^3*H;
end

% Data restructuring for further processing
mmax=(rmmissing(mmax)')*-1;
murp=(rmmissing(murp)')*-1;

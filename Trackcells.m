%% CELL TRACKING FROM .AVI FILES MADE WITH HOKAWO SOFTWARE
% This cell tracking software attempts to track cells from a video
% It will match cells in neighbouring frames based on cell size and cell
% orientation and will eventually perform velocimetry calculations to
% determine the magnetic properties of the cells based on a given magnetic
% field. 

% This script is written by Tom Niessink, 13-7-2021
% As part of a master Thesis 'In flow magnetophoresis'

%% Clear memory and enter parameters of importance

clear; close all; clc;

% Image segmentation parameters
treshold=150;       % Treshold for signals coming from cells
filtersize=1;       % Erosion filter size (1 is okay)

% Video properties
fps = 399/60;           % Framerate in frames per second
px_to_mu = 1050/672;    % Scale in micrometers per pixel

% Physical parameters
R = 5E-6;           % Cell radius (m)
eta = 8.13E-3;      % Viscosity of the medium (Pa*m)
grH2 = 8.1E10;      % Magnetic field gradient (A^2m^3, COMSOL)
H=42291;            % Magnetic field (Am^2, COMSOL)


%% Read video
% This part reads the video and opens the videoplayer module

filename = uigetfile('*.avi');
v = VideoReader(filename);
vd=vision.VideoPlayer();

%% Video segmentation
% This part segments the video based on the properties defined before

frame_segmented=segmentvideo(v,treshold,filtersize);

%% Cell location over all frames
% This part locates cells in the segmented frames

proptable=locatecells(frame_segmented,v);

%% Trajectory calculation
% The found cells are matched over the different frames to form
% trajectories

[Trajectory] = celltracking(proptable,v);

%% Trajectory cleanup
% Only trajectories >5 cells are kept 

[Trajectory] = cleantrajectory(Trajectory,5,v);

%% Trajectory plotting
% This shows the calculated trajectories to the user 

plottrajectories(Trajectory);

%% Velocimetry
% Calculate traveled distance in pixels over framenumber  for each
% trajectory

[VY_PX] = calculatevy_px(Trajectory);

% Recalculate velocity in micrometers per seconds

[VY_mus] = calculatevy_mus(VY_PX,fps,px_to_mu);

% Calculate relative permeability and maximum magnetic moment

[murp,mmax]=calculate_mmax(VY_mus,R,eta,grH2,H);

% Basic plotting
figure(21);
histogram(mmax,-10E-12:10E-15:10E-12)
xlim([-0E-12 10E-12]);
xlabel('Magnetic moment (Am^2)')
ylabel('Cell count')
# CellTracker

A MATLAB based CellTracker script which can perform velocimetry measurements on magnetic cells 
This script is written by Tom Niessink as part of a master thesis 'In flow magnetophoresis', 
University of Twente, the Netherlands.

Correspondation to niessinktom@gmail.com

Trackcells.m is the main script, which calls the other files. Simply pressing run will allow the user to 
load a .avi video file which will be completely processed.

celltracking.m is the function containing the CellTracking algorithm. 
findmatch.m is utilized within this function to match cells from different frames.

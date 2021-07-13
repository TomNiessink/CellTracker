# CellTracker

A MATLAB based CellTracker script which can perform velocimetry measurements on magnetic cells. 
This script is written by Tom Niessink as part of a master thesis 'In flow magnetophoresis', 
University of Twente, the Netherlands.

Trackcells.m is the main script, which calls the other files. Simply pressing run will allow the user to 
load a .avi video file which will be completely processed.

tracking/celltracking.m is the function containing the CellTracking algorithm. 

tracking/findmatch.m is utilized within this function to match cells from different frames.

Correspondation to niessinktom@gmail.com

function C = import_HbO(subj, setnum)
%% Import data from text file.
% Auto-generated by MATLAB on 2015/07/08 11:36:56

%% Global Variables
global direc

%% Find file

if strcmp(subj,'JK') == 1
    subjnum = '19';
elseif strcmp(subj,'MRA') == 1
    subjnum = '17';
elseif strcmp(subj,'NC') == 1
    subjnum = '23';
elseif strcmp(subj,'SC') == 1
    subjnum = '11';
end

file = dir(strcat(direc,subj,'\offline\NIRX\2015-02-',subjnum,'_',setnum,'\exportData\Filtered\*.txt'));
file = file.name;
filename = strcat(direc,subj,'\offline\NIRX\2015-02-',subjnum,'_',setnum,'\exportData\Filtered\',file);
%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
%	column8: double (%f)
%   column9: double (%f)
%	column10: double (%f)
%   column11: double (%f)
%	column12: double (%f)
%   column13: double (%f)
%	column14: double (%f)
%   column15: double (%f)
%	column16: double (%f)
%   column17: double (%f)
%	column18: double (%f)
%   column19: double (%f)
%	column20: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'EmptyValue' ,NaN, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Create output variable
C = [dataArray{1:end-1}];
%% Clear temporary variables
%clearvars filename formatSpec fileID dataArray ans;
end
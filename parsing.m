clc;
close all;
clear all;
%load ASC file and correspondent CSV file from given directory
%set directory path
%data_files_content.path = '/Users/mapc3/Documents/MATLAB/Data_Eye_Tracking_Sessions/data 01-03/Eyes on the Line';
%data_files_content.path = '/Users/mapc3/Documents/MATLAB/Data_Eye_Tracking_Sessions/data 11-03/Eyes on the Line';
data_files_content.path = '/Users/frenkyo/Documents/MATLAB/Data_Eye_Tracking_Sessions.nosync/data 01-03/Eyes on the Line'; %part_21
%check if there are ASC files
%TODO fire error if there are issues with ASC files
data_files_content.current_dir_asc_files=dir(fullfile(data_files_content.path,'*.asc'));
%for each ASC file open also the corresponding CSV file
for ii=1:length(data_files_content.current_dir_asc_files)
    data_files_content.current_asc_file.fullname = data_files_content.current_dir_asc_files(ii).name;
    %get ID for the ASC file
    data_files_content.current_asc_file_id = fopen([data_files_content.path '/' data_files_content.current_asc_file.fullname]);
    %get the filename from the ASC file
    [data_files_content.current_asc_file.pathstr,data_files_content.current_asc_file.name,data_files_content.current_asc_file.ext] = fileparts(data_files_content.current_dir_asc_files(ii).name);
    %get ID for the CSV file
    data_files_content.current_csv_file_id = fopen([data_files_content.path '/' data_files_content.current_asc_file.name '.csv']);
    %read ASC file
    data_files_content.current_asc_file_content = fread(data_files_content.current_asc_file_id,'*char')';
    %read CSV file
    data_files_content.current_csv_file_content = my_csv_reader( data_files_content.current_csv_file_id );
    %--
    %get events from ASC file 
    data_files_content.current_asc_file_events = get_events_from_asc_file( data_files_content.current_asc_file_content );
    %parse events
    participant_trials_parsed_matrix = parse_events( data_files_content.current_asc_file_events, data_files_content.current_csv_file_content );
    %disp(participant_trials_parsed_matrix);
    %and save them on a MAT file
    save([data_files_content.path '/'  data_files_content.current_asc_file.name '_p.mat'], 'participant_trials_parsed_matrix');   
    %close the files
    fclose(data_files_content.current_asc_file_id);
    fclose(data_files_content.current_csv_file_id);
end
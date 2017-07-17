close all;
clear all;
%load ASC file and correspondent CSV file from given directory
%set directory path
%Data_Files.path = '/Users/mapc3/Documents/MATLAB/Data_Eye_Tracking_Sessions/data 01-03/Eyes on the Line';
Data_Files.path = '/Users/mapc3/Documents/MATLAB/Data_Eye_Tracking_Sessions/data 11-03/Eyes on the Line';
%check if there are ASC files otherwise fire error
Data_Files.current_dir_asc_files=dir(fullfile(Data_Files.path,'*.asc'));
%for each ASC file open also the corresponding CSV file
for ii=1:length(Data_Files.current_dir_asc_files)
    Data_Files.current_asc_file.fullname = Data_Files.current_dir_asc_files(ii).name;
    %get ID for the ASC file
    Data_Files.current_asc_file_id = fopen([Data_Files.path '/' Data_Files.current_asc_file.fullname]);
    %get the filename from the ASC file
    [Data_Files.current_asc_file.pathstr,Data_Files.current_asc_file.name,Data_Files.current_asc_file.ext] = fileparts(Data_Files.current_dir_asc_files(ii).name);
    %get ID for the CSV file
    Data_Files.current_csv_file_id = fopen([Data_Files.path '/' Data_Files.current_asc_file.name '.csv']);
    %read ASC file
    Data_Files.current_asc_file_content = fread(Data_Files.current_asc_file_id,'*char')';
    %read CSV file
    Data_Files.current_csv_file_content = my_csv_reader( Data_Files.current_csv_file_id );
    %--
    %get events from ASC file and save them on a MAT file
    Data_Files.current_asc_file_events = get_events_from_asc_file( Data_Files.current_asc_file_content, Data_Files.path, Data_Files.current_asc_file.name );

    %parse events
    parse_events( Data_Files.current_asc_file_events, Data_Files.current_csv_file_content );
    
    %close the files
    fclose(Data_Files.current_asc_file_id);
    fclose(Data_Files.current_csv_file_id);
end
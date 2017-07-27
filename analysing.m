clc;
close all;
clear all;
%load MAT file from given directory
%in each MAT file (participant) there are all the trials done by that specific
%participant
%set directory path
%data_files_content.path = '/Users/mapc3/Documents/MATLAB/Data_Eye_Tracking_Sessions/data 01-03/Eyes on the Line';
%data_files_content.path = '/Users/mapc3/Documents/MATLAB/Data_Eye_Tracking_Sessions/data 11-03/Eyes on the Line';
parsed_data_files_content.path = '/Users/frenkyo/Documents/MATLAB/Data_Eye_Tracking_Sessions.nosync/data 01-03/Eyes on the Line';
%check if there are MAT files
%TODO fire error if there are issues with MAT files
parsed_data_files_content.current_dir_mat_files=dir(fullfile(parsed_data_files_content.path,'*_p.mat'));
%for each MAT file
for ii=1:length(parsed_data_files_content.current_dir_mat_files)
    parsed_data_files_content.current_mat_file.fullname = parsed_data_files_content.current_dir_mat_files(ii).name;
    %get the filename from the ASC file
    [parsed_data_files_content.current_mat_file.pathstr,parsed_data_files_content.current_mat_file.name,parsed_data_files_content.current_mat_file.ext] = fileparts(parsed_data_files_content.current_dir_mat_files(ii).name);
    %load content MAT file
    %participant_trials_parsed = 
    load([parsed_data_files_content.path '/'  parsed_data_files_content.current_mat_file.name '.mat']);  
    %remove _p from the file name
    parsed_data_files_content.current_mat_file.relevant_name = strsplit(parsed_data_files_content.current_mat_file.name,'_');
    parsed_data_files_content.current_mat_file.relevant_name = cell2mat(parsed_data_files_content.current_mat_file.relevant_name(1,1));
    %TODO maybe I don't need the code here below
    %get the number of trials
    %[rows,columns] = size(participant_trials_parsed);
    %save the analysed data in
    %participant_trials_analysed = cell(1,columns);
    %analyse the data
    participant_trials_analysed = analyse_data( participant_trials_parsed );
    %save the analysed data
    save([parsed_data_files_content.path '/'  parsed_data_files_content.current_mat_file.relevant_name '_a.mat'],'participant_trials_analysed');
end
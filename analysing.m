clc;
close all;
clear all;
%load ASC file and correspondent CSV file from given directory
%set directory path
d = dir('Data_Eye_Tracking_Sessions');
isub = [d(:).isdir];
nameFolds = {d(isub).name}';
nameFolds(ismember(nameFolds,{'.','..','EDF2ASC','bin','4DOS'})) = [];
for jj=1:1%length(nameFolds) 
    [status, parsed_data_files_content.whoiam] = system('whoami');
    parsed_data_files_content.whoiam = regexprep(parsed_data_files_content.whoiam,'\s+','');
    parsed_data_files_content.path = ['/Users/' parsed_data_files_content.whoiam '/Documents/MATLAB/LastFixationOnTheLine_Task/Data_Eye_Tracking_Sessions/' nameFolds{jj} '/Eyes on the Line'];
    %parsed_data_files_content.path = '/Users/mapc3/Documents/MATLAB/Data_Eye_Tracking_Sessions/data 11-03/Eyes on the Line';
    %parsed_data_files_content.path = '/Users/frenkyo/Documents/MATLAB/Data_Eye_Tracking_Sessions.nosync/data 01-03/Eyes on the Line'; %part_21
    %check if there are *_p.mat files
    parsed_data_files_content.current_dir_mat_files=dir(fullfile(parsed_data_files_content.path,'*_p.mat'));
    %for each *_p.mat file
    for ii=5:5%length(parsed_data_files_content.current_dir_mat_files)
        parsed_data_files_content.current_mat_file.fullname = parsed_data_files_content.current_dir_mat_files(ii).name;
        %get the filename from the ASC file
        [parsed_data_files_content.current_mat_file.pathstr,parsed_data_files_content.current_mat_file.name,parsed_data_files_content.current_mat_file.ext] = fileparts(parsed_data_files_content.current_dir_mat_files(ii).name);
        %load content MAT file in participant_trials_parsed_matrix 
        load([parsed_data_files_content.path '/'  parsed_data_files_content.current_mat_file.name '.mat']);  
        %remove _p from the file name
        parsed_data_files_content.current_mat_file.relevant_name = strsplit(parsed_data_files_content.current_mat_file.name,'_');
        parsed_data_files_content.current_mat_file.relevant_name = cell2mat(parsed_data_files_content.current_mat_file.relevant_name(1,1));
        %TODO maybe I don't need the code here below
        %get the number of trials
        %[rows,columns] = size(participant_trials_parsed_matrix);
        %save the analysed data in
        %participant_trials_analysed_matrix = cell(1,columns);
        %analyse the data
        participant_trials_analysed_matrix = analyse_data( participant_trials_parsed_matrix );
        %save the analysed data
        save([parsed_data_files_content.path '/'  parsed_data_files_content.current_mat_file.relevant_name '_a.mat'],'participant_trials_analysed_matrix');
    end
end    
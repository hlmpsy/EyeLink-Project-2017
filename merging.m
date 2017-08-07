clear_vars();
%-
%set directory path
d = dir('Data_Eye_Tracking_Sessions');
isub = [d(:).isdir];
nameFolds = {d(isub).name}';
nameFolds(ismember(nameFolds,{'.','..','EDF2ASC','bin','4DOS'})) = [];
all_participants_results_matrix = {};
for jj=1:1%length(nameFolds) 
    [status, parsed_data_files_content.whoiam] = system('whoami');
    parsed_data_files_content.whoiam = regexprep(parsed_data_files_content.whoiam,'\s+','');
    parsed_data_files_content.path = ['/Users/' parsed_data_files_content.whoiam '/Documents/MATLAB/LastFixationOnTheLine_Task/Data_Eye_Tracking_Sessions/' nameFolds{jj} '/Eyes on the Line'];
    %parsed_data_files_content.path = '/Users/mapc3/Documents/MATLAB/Data_Eye_Tracking_Sessions/data 11-03/Eyes on the Line';
    %parsed_data_files_content.path = '/Users/frenkyo/Documents/MATLAB/Data_Eye_Tracking_Sessions.nosync/data 01-03/Eyes on the Line'; %part_21
    %check if there are *_a.mat files
    parsed_data_files_content.current_dir_mat_files=dir(fullfile(parsed_data_files_content.path,'*_a.mat'));
    %for each *_a.mat file
    for ii=1:length(parsed_data_files_content.current_dir_mat_files)
        parsed_data_files_content.current_mat_file.fullname = parsed_data_files_content.current_dir_mat_files(ii).name;
        %get the filename from the ASC file
        [parsed_data_files_content.current_mat_file.pathstr,parsed_data_files_content.current_mat_file.name,parsed_data_files_content.current_mat_file.ext] = fileparts(parsed_data_files_content.current_dir_mat_files(ii).name);
        %load content MAT file in participant_trials_analysed_matrix 
        load([parsed_data_files_content.path '/'  parsed_data_files_content.current_mat_file.name '.mat']);  
        %remove _a from the file name
        parsed_data_files_content.current_mat_file.relevant_name = strsplit(parsed_data_files_content.current_mat_file.name,'_');
        parsed_data_files_content.current_mat_file.relevant_name = cell2mat(parsed_data_files_content.current_mat_file.relevant_name(1,1));
        if (jj==1 && ii == 1)
            all_participants_results_matrix = [all_participants_results_matrix; participant_trials_analysed_matrix];
        else
            all_participants_results_matrix = [all_participants_results_matrix; participant_trials_analysed_matrix(2:end,1:end)];
        end
    end
end
%disp(['/Users/' parsed_data_files_content.whoiam '/Documents/MATLAB/Data_Eye_Tracking_Sessions/results_matrix.mat']);
%disp(all_participants_results_matrix);
%save results
save(['/Users/' parsed_data_files_content.whoiam '/Documents/MATLAB/LastFixationOnTheLine_Task/Data_Eye_Tracking_Sessions/results_matrix.mat'],'all_participants_results_matrix');
%save the data on an Excel file
all_participants_results_table = cell2table(all_participants_results_matrix);
%disp(all_participants_results_table);
%remove fixations, saccades and blinks columns
columns = results_matrix_columns();
all_participants_results_table(:,[columns.content columns.fixations columns.saccades columns.blinks]) = [];
%in the first column there is the content of each edf file, discard it
% all_participants_results_table = all_participants_results_table(:,2:end);
%disp(all_participants_results_table);
%columns' order
columns_order = [13 14 5 1 11 9 12 10 2 3 6 7 4 8 15 16 17 18 19];
disp(all_participants_results_table(2:end,14));
summary(all_participants_results_table);
all_participants_results_table = all_participants_results_table(:,columns_order);
filename = ['/Users/' parsed_data_files_content.whoiam '/Documents/MATLAB/LastFixationOnTheLine_Task/Data_Eye_Tracking_Sessions/results_matrix.xlsx'];
writetable(all_participants_results_table,filename,'Sheet',1,'WriteVariableNames',false);

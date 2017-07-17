function csv_content = my_csv_reader( csv_file_id )
    % '*' means skip that column
    % column            number
    % ------------------------
    % ChosenNumber      3
    % ChosenX           5
    % ChosenY           6
    % Condition         7
    % RealNumber        15
    % TrialNumPerCond   19
    % TrialNumber       20
    % order             123
    % subject_nr        162
    % ------------------------ 
    wanted_cols=[3 5 6 7 15 19 20 123 162];
    format=[];
    for ii=1:210
        if any(ii==wanted_cols)
            format=[format '%q'];
        else
            format=[format '%*q'];
        end
    end
    %exclude all the remaining columns
    format=[format ' %*[^\n]'];
    %disp(format);
    temp_csv_content = textscan(csv_file_id, format, 'delimiter', ',');
    %--
    csv_content.ChosenNumber = temp_csv_content{1}(2:length(temp_csv_content{1}));
    csv_content.ChosenX = temp_csv_content{2}(2:length(temp_csv_content{2}));
    csv_content.ChosenY = temp_csv_content{3}(2:length(temp_csv_content{3}));
    csv_content.Condition = temp_csv_content{4}(2:length(temp_csv_content{4}));
    csv_content.RealNumber = temp_csv_content{5}(2:length(temp_csv_content{5}));
    csv_content.TrialNumPerCond = temp_csv_content{6}(2:length(temp_csv_content{6}));
    csv_content.TrialNumber = temp_csv_content{7}(2:length(temp_csv_content{7}));
    csv_content.order = temp_csv_content{8}(2:length(temp_csv_content{8}));
    csv_content.subject_nr = temp_csv_content{9}(2:length(temp_csv_content{9}));
end
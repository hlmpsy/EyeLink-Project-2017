function csv_content = my_csv_reader( csv_file_id )
    % '*' means skip that column
    % column            number
    % ------------------------
    % ChosenNumber      3
    % ChosenRT          4
    % ChosenX           5
    % ChosenY           6
    % Condition         7
    % PAE               13
    % RealNumber        15
    % TrialNumPerCond   19
    % TrialNumber       20
    % order             123
    % subject_nr        162
    % ------------------------ 
    wanted_cols=[3 4 5 6 7 13 15 19 20 123 162];
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
    csv_content.ChosenNumber = str2double(temp_csv_content{1}(2:length(temp_csv_content{1})));
    csv_content.ChosenRT = str2double(temp_csv_content{2}(2:length(temp_csv_content{2})));
    csv_content.ChosenX = str2double(temp_csv_content{3}(2:length(temp_csv_content{3})));
    csv_content.ChosenY = str2double(temp_csv_content{4}(2:length(temp_csv_content{4})));
    csv_content.Condition = temp_csv_content{5}(2:length(temp_csv_content{5}));
    csv_content.pae = str2double(temp_csv_content{6}(2:length(temp_csv_content{6})));
    csv_content.RealNumber = str2double(temp_csv_content{7}(2:length(temp_csv_content{7})));
    csv_content.TrialNumPerCond = str2double(temp_csv_content{8}(2:length(temp_csv_content{8})));
    csv_content.TrialNumber = str2double(temp_csv_content{9}(2:length(temp_csv_content{9})));
    csv_content.order = temp_csv_content{10}(2:length(temp_csv_content{10}));
    csv_content.subject_nr = str2double(temp_csv_content{11}(2:length(temp_csv_content{11})));
end
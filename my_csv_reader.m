function csv_content = my_csv_reader( csv_file_id )
    frewind(csv_file_id);
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
    % RealnumberThatWasShownIs        16
    % TrialNumPerCond   19
    % TrialNumber       20
    % order             122
    % subject_nr        162
    % ------------------------ 
    wanted_cols=[1:200];
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
    for ii=1:200
%         disp(temp_csv_content{ii}(1:1));
        if strcmp(temp_csv_content{ii}(1:1),'ChosenNumber')
            column.ChosenNumber = ii;
%             disp(column.Condition);
        end
        if strcmp(temp_csv_content{ii}(1:1),'ChosenRT')
            column.ChosenRT = ii;
%             disp(column.Condition);
        end
        if strcmp(temp_csv_content{ii}(1:1),'ChosenX')
            column.ChosenX = ii;
%             disp(column.Condition);
        end
        if strcmp(temp_csv_content{ii}(1:1),'ChosenY')
            column.ChosenY = ii;
%             disp(column.Condition);
        end
        if strcmp(temp_csv_content{ii}(1:1),'Condition')
            column.Condition = ii;
%             disp(column.Condition);
        end
        if strcmp(temp_csv_content{ii}(1:1),'PAE')
            column.PAE = ii;
%             disp(column.Condition);
        end
        if strcmp(temp_csv_content{ii}(1:1),'RealNumber')
            column.RealNumber = ii;
%             disp(column.RealNumber);
        end
        if strcmp(temp_csv_content{ii}(1:1),'RealnumberThatWasShownIs')
            column.RealnumberThatWasShownIs = ii;
%             disp(column.RealNumber);
        end
        if strcmp(temp_csv_content{ii}(1:1),'TrialNumPerCond')
            column.TrialNumPerCond = ii;
%             disp(column.TrialNumber);
        end
        if strcmp(temp_csv_content{ii}(1:1),'TrialNumber')
            column.TrialNumber = ii;
%             disp(column.TrialNumber);
        end
        if strcmp(temp_csv_content{ii}(1:1),'order')
            column.order = ii;
%             disp(column.order);
        end
        if strcmp(temp_csv_content{ii}(1:1),'subject_nr')
            column.subject_nr = ii;
%             disp(column.order);
        end
    end
    %--
    csv_content.ChosenNumber = str2double(temp_csv_content{column.ChosenNumber}(2:length(temp_csv_content{column.ChosenNumber})));
    csv_content.ChosenRT = str2double(temp_csv_content{column.ChosenRT}(2:length(temp_csv_content{column.ChosenRT})));
    csv_content.ChosenX = str2double(temp_csv_content{column.ChosenX}(2:length(temp_csv_content{column.ChosenX})));
    csv_content.ChosenY = str2double(temp_csv_content{column.ChosenY}(2:length(temp_csv_content{column.ChosenY})));
    csv_content.Condition = temp_csv_content{column.Condition}(2:length(temp_csv_content{column.Condition}));
    csv_content.pae = str2double(temp_csv_content{column.PAE}(2:length(temp_csv_content{column.PAE})));
    csv_content.RealNumber = str2double(temp_csv_content{column.RealNumber}(2:length(temp_csv_content{column.RealNumber})));
    csv_content.TrialNumPerCond = str2double(temp_csv_content{column.TrialNumPerCond}(2:length(temp_csv_content{column.TrialNumPerCond})));
    csv_content.TrialNumber = str2double(temp_csv_content{column.TrialNumber}(2:length(temp_csv_content{column.TrialNumber})));
    csv_content.order = temp_csv_content{column.order}(2:length(temp_csv_content{column.order}));
    csv_content.subject_nr = str2double(temp_csv_content{column.subject_nr}(2:length(temp_csv_content{column.subject_nr})));
end
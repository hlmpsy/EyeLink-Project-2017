function analaysed_data_matrix = analyse_data( trials_data )    
    NA = -999999;
    %trials_data is a matrix with as many rows as trials and the columns are defined in 'results_matrix_columns.m' 
    columns = results_matrix_columns();
    %number of trials
    [num_trials, num_fields] = size( trials_data );
    %add fields calculated here
    trials_data{1,columns.valid} = {'valid'}; 
    trials_data{1,columns.last_fixation_x} = {'columns.last_fixation_x'};
    trials_data{1,columns.last_fixation_y} = {'columns.last_fixation_y'};
    trials_data{1,columns.last_fixation_real_num} = {'columns.last_fixation_real_num'};
    trials_data{1,columns.asc_pae} = {'asc_pae'}; 
    %analyse each trial
    fprintf('There are %d trials.\n',num_trials);
    for ii = 1 : (num_trials - 1) 
        %-
        %get valid fixations
        valid_fixations = get_valid_fixations(trials_data{ii+1,columns.fixations}, trials_data{ii+1,columns.blinks});
        %check if a trial is valid
        trial.valid = check_validity_trial( trials_data(ii+1,:), valid_fixations );
        %keep track of non valid trials as well
        trials_data{ii+1,columns.valid} = trial.valid;
        %trial.csv_rtime from opensesame (CSV)
        int_rtime = trials_data{ii+1,columns.csv_rtime}; %csv_rtime
        int_rtime = round(str2double(int_rtime));
        %the spacebar is pressed at stime + rtime
        %the stime here comes from opensesame (CSV) as well
        spacebar_time = num2str(str2double(trials_data{ii+1,columns.stime}) + int_rtime - 2);
%         disp(spacebar_time);
%         disp(trials_data{ii+1,columns.csv_subject_nr});
        loc = get_events_location(trials_data{ii+1,columns.content} , spacebar_time );
        %check if it is inside a fix
        last_sfix_loc = trials_data{ii+1,columns.fixations}.sfix.locations(end);
        last_efix_loc = trials_data{ii+1,columns.fixations}.efix.locations(end);
%         disp(loc);
%         disp(last_sfix_loc);
%         disp(last_efix_loc);
        is_in_last_fix = (loc > last_sfix_loc) && (loc < last_efix_loc);
        %and it is not in a saccade
        last_ssacc_loc = trials_data{ii+1,columns.saccades}.ssacc.locations(end);
        last_esacc_loc = trials_data{ii+1,columns.saccades}.esacc.locations(end);
        is_in_last_sacc = (loc > last_ssacc_loc) && (loc < last_esacc_loc);
        %TODO if it is last saccade then throw an error
        if (trial.valid)
            if (is_in_last_fix && ~is_in_last_sacc)
                %- 
                %calc my own average x and y
                %[mean_x, mean_y] = get_x_and_y_mean( trial.content, last_sfix_loc, last_efix_loc );
                %disp(mean_x);
                %disp(mean_y);
                %-
                %use eyelink average x and y
                %first check if x and y are in AOI #3
                x = str2double(trials_data{ii+1,columns.fixations}.efix.x(end));
                y = str2double(trials_data{ii+1,columns.fixations}.efix.y(end));
                %if they aren't in AOI #3 then discard
                %TODO maybe other conditions needed
                if get_aoi(x,y, trials_data{ii+1,columns.content}) == 3
                    %calc PAE 
                    trial.real_number = str2double(trials_data{ii+1,columns.asc_real_number});
                    trial.asc_pae = get_pae( nol2px(trial.real_number), x );
                    %add to matrix
                    trials_data{ii+1,columns.asc_pae} = trial.asc_pae;
                    trials_data{ii+1,columns.last_fixation_x} = x;
                    trials_data{ii+1,columns.last_fixation_y} = y;
                    trials_data{ii+1,columns.last_fixation_real_num} = px2nol(x);
                else
                    %add to matrix
                    trials_data{ii+1,columns.asc_pae} = NA;
                    trials_data{ii+1,columns.last_fixation_x} = NA;
                    trials_data{ii+1,columns.last_fixation_y} = NA;
                    trials_data{ii+1,columns.last_fixation_real_num} = px2nol(NA);
                end
            else
                disp(ii);
                disp(trials_data{ii+1,columns.csv_subject_nr});
                disp(is_in_last_fix);
                disp(is_in_last_sacc);
                disp(spacebar_time);
                error("Spacebar pressed not during a FIX");
            end
        else
            %add to matrix
            trials_data{ii+1,columns.asc_pae} = NA;
        end
        %-
        %return the matrix
        analaysed_data_matrix = trials_data;
        %-
    end
end
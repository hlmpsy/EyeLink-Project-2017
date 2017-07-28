function trials = analyse_data( trials_data )
    %number of trials
    [rows,num_trials] = size( trials_data );
    trials = cell(1,num_trials);
    %analyse each trial
    for ii = 3 : 3%num_trials
        trial = trials_data{ii};
        %-
        %suppose trial is valid
        trial.valid = true;
        %-
        %TODO maybe move this to another file
        %determine during which saccade there is a blink:
        trial.saccades_with_blink = get_saccades_with_blink(trials_data{ii}.saccades, trials_data{ii}.blinks);
        %-
        %fixations
        trial.fixations;
        %disp(trial.fixations);
        %TODO maybe this stime is not useful
        %trial stime
        trial.stime;
        %disp(trial.stime);
        %response time
        trial.csv_rtime;
        %disp(trial.csv_rtime);
        int_rtime = trial.csv_rtime;
        int_rtime = round(str2double(int_rtime));
        %disp(int_rtime);
        %get location of stime + rtime
        spacebar_time = num2str(str2double(trial.stime) + int_rtime);
        %disp(spacebar_time);
        loc = get_events_location(trial.content , spacebar_time );
        %disp( loc );
        %disp(trial.content(loc));
        %check if it is inside a fix
        %disp(trial.fixations.sfix);
        %disp(trial.fixations.sfix.locations(end));
        %disp(trial.fixations.efix);
        %disp(trial.fixations.efix.locations(end));
        last_sfix_loc = trial.fixations.sfix.locations(end);
        last_efix_loc = trial.fixations.efix.locations(end);
        is_in_last_fix = (loc > last_sfix_loc) && (loc < last_efix_loc);
        %and it is not in a saccade
        %disp(trial.saccades);
        %disp(trial.saccades.ssacc.locations(end));
        %disp(trial.saccades.esacc);
        %disp(trial.saccades.esacc.locations(end));
        last_ssacc_loc = trial.saccades.ssacc.locations(end);
        last_esacc_loc = trial.saccades.esacc.locations(end);
        is_in_last_sacc = (loc > last_ssacc_loc) && (loc < last_esacc_loc);
        %TODO if it is last saccade then throw an error
        %clc;
        disp(str2double(trial.stime));
        disp(int_rtime);
        disp(spacebar_time);
        disp((is_in_last_fix && ~is_in_last_sacc));
        if (is_in_last_fix && ~is_in_last_sacc)
            %- 
            %calc my own average x and y
            %[mean_x, mean_y] = get_x_and_y_mean( trial.content, last_sfix_loc, last_efix_loc );
            %disp(mean_x);
            %disp(mean_y);
            %-
            %use eyelink average x and y
            %first check if x and y are in AOI #3
            x = str2double(trial.fixations.efix.x(end));
            y = str2double(trial.fixations.efix.y(end));
            %if they aren't in AOI #3 then discard
            %TODO maybe other conditions needed
            if aoi_3(x,y)
                %calc PAE 
                trial.real_number = str2double(trial.asc_real_number);
                trial.pae = get_pae( nol2px(trial.real_number), x );
                disp(trial.pae);
                %trial.pae = get_pae( real_number, px2nol(x) );
                %disp(trial.pae);
                %trial.csv_subject_nr
                %trial.csv_order
                %trial.csv_Condition
                %trial.csv_TrialNumber
                %trial.csv_rtime
                %trial.csv_ChosenX
                %trial.csv_ChosenY
                %trial.csv_ChosenNumber
                %trial.csv_pae
                disp({trial.csv_subject_nr, trial.csv_order, trial.csv_Condition, trial.csv_TrialNumber, trial.csv_rtime, trial.csv_ChosenX, trial.csv_ChosenY, trial.csv_ChosenNumber, trial.csv_pae, trial.pae});
            else
                %throw an error
                error('x and y not in AOI #3');
            end
        end
        %-
        %save trial in the cell array trials
        trials{1,ii} = trial;
        %-
    end
end
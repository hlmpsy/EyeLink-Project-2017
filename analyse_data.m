function trials = analyse_data( trials_data )
    %number of trials
    [rows,num_trials] = size( trials_data );
    trials = cell(1,num_trials);
    %analyse each trial
    for ii = 1 : 1%num_trials
        %-
        %TODO maybe move this to another file
        %determine during which saccade there is a blink:
        trial.saccades_with_blink = get_saccades_with_blink(trials_data{ii}.saccades, trials_data{ii}.blinks);
        %-
        %fixations
        trials_data{ii}.fixations;
        disp(trials_data{ii}.fixations);
        %trial stime
        trials_data{ii}.stime;
        disp(trials_data{ii}.stime);
        %response time
        trials_data{ii}.rtime;
        disp(trials_data{ii}.rtime);
        int_rtime = trials_data{ii}.rtime;
        int_rtime = round(str2double(int_rtime));
        disp(int_rtime);
        %get location of stime + rtime
        spacebar_time = num2str(str2double(trials_data{ii}.stime) + int_rtime);
        disp(spacebar_time);
        loc = get_events_location(trials_data{ii}.content , spacebar_time );
        disp( loc );
        disp(trials_data{ii}.content(loc));
        %check if it is inside a fix
        %disp(trials_data{ii}.fixations.sfix);
        %disp(trials_data{ii}.fixations.sfix.locations(end));
        %disp(trials_data{ii}.fixations.efix);
        %disp(trials_data{ii}.fixations.efix.locations(end));
        last_sfix_loc = trials_data{ii}.fixations.sfix.locations(end);
        last_efix_loc = trials_data{ii}.fixations.efix.locations(end);
        is_in_last_fix = (loc > last_sfix_loc) && (loc < last_efix_loc);
        %and it is not in a saccade
        %disp(trials_data{ii}.saccades);
        %disp(trials_data{ii}.saccades.ssacc.locations(end));
        %disp(trials_data{ii}.saccades.esacc);
        %disp(trials_data{ii}.saccades.esacc.locations(end));
        last_ssacc_loc = trials_data{ii}.saccades.ssacc.locations(end);
        last_esacc_loc = trials_data{ii}.saccades.esacc.locations(end);
        is_in_last_sacc = (loc > last_ssacc_loc) && (loc < last_esacc_loc);
        %TODO if it is last saccade then throw an error
        clc;
        if( is_in_last_fix && ~is_in_last_sacc)
            %calculate the average x and y
            %disp(trials_data{ii}.fixations.sfix.locations);
            %content that has to be analysed
            current.content = trials_data{ii}.content((last_sfix_loc + 1):(last_efix_loc-1));%loc or (last_efix_loc-1)
            %disp((last_sfix_loc + 1));
            %disp(last_efix_loc);
            %disp(current.content);
            [current.x, current.y] = get_x_and_y( current.content );
            [num_rows, num_columns] = size(current.x);
            for ii = 1:num_columns
                current.x_mean = mean(current.x(1:ii));
                current.y_mean = mean(current.y(1:ii));
                if (current.x_mean < 2000) && (current.x_mean > 1000) && (current.y_mean < 200)  && (current.y_mean > 100)
                    disp(current.x_mean);
                    disp(current.y_mean);
                end
            end
            %current.x_mean = mean(current.x);
            %current.y_mean = mean(current.y);
            %disp(current.x_mean);
            %disp(current.y_mean);
        end
        %-
        %save trial in the cell array trials
        trials{1,ii} = trial;
        %-
    end
end
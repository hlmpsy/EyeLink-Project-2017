function trials = analyse_data( trials_data )
    %number of trials
    [rows,num_trials] = size( trials_data );
    trials = cell(1,num_trials);
    %analyse each trial
    for ii = 2 : 2%num_trials
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
            current.content = trials_data{ii}.content(last_sfix_loc:loc);
            [current.x, current.y] = get_values( current.content );
        end
        %-
        %save trial in the cell array trials
        trials{1,ii} = trial;
        %-
    end
end
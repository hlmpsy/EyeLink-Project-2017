function analaysed_data_matrix = analyse_data( trials_data )
    %number of trials
    [num_trials, num_fields] = size( trials_data );
    %add fields calculated here
    trials_data{1,num_fields + 1} = {'valid'}; 
    trials_data{1,num_fields + 2} = {'saccades_with_blink'}; 
    trials_data{1,num_fields + 3} = {'asc_pae'}; 
    %trials = cell(1,num_trials);
    disp(trials_data{1+1,2});
    %analyse each trial
    for ii = 1 : (num_trials - 1) 
%         trial = trials_data{ii};
%         disp(trials_data{ii});
        %-
        %suppose trial is valid
        trial.valid = true;
        trials_data{ii+1,num_fields + 1} = trial.valid;
        %-
        %TODO maybe move this to another file
        %determine during which saccade there is a blink:
        trial.saccades_with_blink = get_saccades_with_blink(trials_data{ii+1,17}, trials_data{ii+1,18});
        trials_data{ii+1,num_fields + 2} = trial.saccades_with_blink;
        %-
        %trial.stime is now from opensesame
        int_rtime = trials_data{ii+1,6}; %csv_rtime
        int_rtime = round(str2double(int_rtime));
        %get location of stime + rtime
        spacebar_time = num2str(str2double(trials_data{ii+1,15}) + int_rtime);
        loc = get_events_location(trials_data{ii+1,1} , spacebar_time );
        %check if it is inside a fix
        last_sfix_loc = trials_data{ii+1,16}.sfix.locations(end);
        last_efix_loc = trials_data{ii+1,16}.efix.locations(end);
        is_in_last_fix = (loc > last_sfix_loc) && (loc < last_efix_loc);
        %and it is not in a saccade
        last_ssacc_loc = trials_data{ii+1,17}.ssacc.locations(end);
        last_esacc_loc = trials_data{ii+1,17}.esacc.locations(end);
        is_in_last_sacc = (loc > last_ssacc_loc) && (loc < last_esacc_loc);
        %TODO if it is last saccade then throw an error
        disp(str2double(trials_data{ii+1,15}));
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
            x = str2double(trials_data{ii+1,16}.efix.x(end));
            y = str2double(trials_data{ii+1,16}.efix.y(end));
            %if they aren't in AOI #3 then discard
            %TODO maybe other conditions needed
            if aoi_3(x,y)
                %calc PAE 
                trial.real_number = str2double(trials_data{ii+1,3});
                trial.asc_pae = get_pae( nol2px(trial.real_number), x );
                disp(trial.asc_pae);
                %add to matrix
                trials_data{ii+1,num_fields + 3} = trial.asc_pae;
            else
                %throw an error
                error('x and y not in AOI #3');
            end
            
        end
        disp(trials_data);
        %-
        %save trial in the cell array trials
        %trials{1,ii} = trial;
        analaysed_data_matrix = trials_data;
        %-
    end
end
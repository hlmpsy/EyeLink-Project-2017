function parse_events( asc_events, csv_content )
    %each ASC file corresponds to one session attained by one participant
    %and every session is splitted in trials
    trials = get_trials( asc_events );
    fprintf('There are %d trials.\n',trials.size);
    %parse each trial
    for ii = 134 : 134%trials.size
        %for every trial compare trial number and real number in the ASC  
        %file with 
        %trial number and real number in the CSV file
        %if they are not equal fire an error
        %this is done because it could be that the CSV file rows aren't 
        %ordered by trial number
        %--
        %get trial number and real number of the trial from ASC file
        trial_info_event_location = get_events_location(trials.content{ii},'trail');
        %-
        %example of the trial MSG:
        %1      2       3           4   5   6     7  8     9 10 11
        %MSG	1225114 RealNumber that was shown in trail 1 is 71
        %-
        %get trial number from ASC file
        asc_trial_number = get_event_content(trials.content{ii}{trial_info_event_location}, 9, 9 );
        %get real number from ASC file
        asc_real_number = get_event_content(trials.content{ii}{trial_info_event_location}, 11, 11 );
        %find the row corresponding to the trial number in the CSV file
        csv_row = find(strcmp(csv_content.TrialNumber, asc_trial_number));
        %get real number from CSV file
        csv_real_number = csv_content.RealNumber{csv_row};
        %chek if they coincide
        if  csv_real_number ~= asc_real_number{1}
           error('Err. real number not matching in ASC and CSV file');
           return;
        end
        %-
        %other info in the csv file:
        %get condition
        disp(csv_content.Condition{csv_row});
        %get session
        disp(csv_content.order{csv_row});
        %get subject number
        disp(csv_content.subject_nr{csv_row});
        %-
        %get trial stime from the asc file:
        trial_stime = get_trial_stime( trials.content{ii} );
        %-
        %get fixations:
        trial_fixations = get_fixations( trials.content{ii} );
        %-
        %get saccades:
        trial_saccades = get_saccades( trials.content{ii} );
        %-
        %get blinks:
        trial_blinks = get_blinks( trials.content{ii} );
        %-
        %determine during which saccade there is a blink:
        trial_saccades.saccades_with_blink = get_saccades_with_blink(trial_saccades, trial_blinks);
        %-
        %plot 
        %plot fixations
        my_plot( trials.content{ii} );
        x = cellfun(@str2num,trial_fixations.efix.x);
        y = cellfun(@str2num,trial_fixations.efix.y);
        hold on;   
        plot(x,y,'Marker', 'o', 'MarkerSize', 4, 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b');
    end
end
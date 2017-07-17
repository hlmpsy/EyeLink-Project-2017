function trials = get_trials( events )
    %get the end position of every trial
    end_of_trial = get_events_location(events,'stop_trial');
    %get the number of trials
    trials.size = length(end_of_trial);
    %first trial start in position 1
    start_of_trial = 1;
    for ii=1:length(end_of_trial)
        %save all trials content in trials.content
        trials.content{ii} = events(start_of_trial:end_of_trial(ii));
        %update the starting position of the next trial
        start_of_trial = end_of_trial(ii)+1;
    end
end
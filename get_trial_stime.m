function trial_stime = get_trial_stime( content )
    %get trial start time
    trial_stime_location = get_events_location(content,'START');
    %disp(content{trial_stime_location});
    %-
    %example of the trial MSG:
    %1      2           3       4       5
    %START	timestamp 	LEFT	SAMPLES	EVENTS
    %-
    trial_stime = get_event_content(content{trial_stime_location}, 2, 2 );
end
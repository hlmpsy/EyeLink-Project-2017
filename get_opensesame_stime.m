function opensesame_stime = get_opensesame_stime( content )
    %get trial start time
    opensesame_stime_location = get_events_location(content,'start_trial');
    %disp(content{opensesame_stime_location});
    %-
    %example of the trial MSG:
    %1      2         3       
    %MSG	timestamp start_trial
    %-
    opensesame_stime = get_event_content(content{opensesame_stime_location}, 2, 2 );
end


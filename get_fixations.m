function fixations = get_fixations( content )
    %get start fixations:
    fixations.sfix.locations = get_events_location(content,'SFIX');
    fixations.sfix.msgs = content(fixations.sfix.locations);
    %disp(fixations.sfix.msgs{1});
    %-
    %example of the trial MSG:
    %1    2     3       
    %SFIX eye   stime	
    %-
    %
    fixations.sfix.eye = cellfun(@(x) get_event_content(x,2,2), fixations.sfix.msgs);
    %disp(fixations.sfix.eye{1});
    fixations.sfix.stime = cellfun(@(x) get_event_content(x,3,3), fixations.sfix.msgs);
    %disp(fixations.sfix.stime{1});
    %-
    %get end fixations:
    fixations.efix.locations = get_events_location(content,'EFIX');
    fixations.efix.msgs = content(fixations.efix.locations);
    %disp(fixations.efix.msgs{1});
    %-
    %example of the trial MSG:
    %1    2     3       4       5     6   7    8
    %EFIX eye   stime	etime	dur	  x	  y	   aps
    %-
    %
    fixations.efix.eye = cellfun(@(x) get_event_content(x,2,2), fixations.efix.msgs);
    %disp(fixations.efix.eye{1});
    fixations.efix.stime = cellfun(@(x) get_event_content(x,3,3), fixations.efix.msgs);
    %disp(fixations.efix.stime{1});
    fixations.efix.etime = cellfun(@(x) get_event_content(x,4,4), fixations.efix.msgs);
    %disp(fixations.efix.etime{1});
    fixations.efix.dur = cellfun(@(x) get_event_content(x,5,5), fixations.efix.msgs);
    %disp(fixations.efix.dur{1});
    fixations.efix.x = cellfun(@(x) get_event_content(x,6,6), fixations.efix.msgs);
    %disp(fixations.efix.x{1});
    fixations.efix.y = cellfun(@(x) get_event_content(x,7,7), fixations.efix.msgs);
    %disp(fixations.efix.y{1});
    fixations.efix.aps = cellfun(@(x) get_event_content(x,8,8), fixations.efix.msgs);
    %disp(fixations.efix.aps{1});
end
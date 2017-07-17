function blinks = get_blinks( content )
    %get start blinks:
    blinks.sblink.locations = get_events_location(content,'SBLINK');
    %disp(blinks.sblink.locations);
    blinks.sblink.msgs = content(blinks.sblink.locations);
    %disp(blinks.sblink.msgs{1});
    %-
    %example of the trial MSG:
    %1     2    3       
    %SBLINK eye  stime
    %-
    %  
    blinks.sblink.eye = cellfun(@(x) get_event_content(x,2,2), blinks.sblink.msgs);
    %disp(blinks.sblink.eye{1});
    blinks.sblink.stime = cellfun(@(x) get_event_content(x,3,3), blinks.sblink.msgs);
    %disp(blinks.sblink.stime{1});
    %-
    %get end blinks:
    blinks.eblink.locations = get_events_location(content,'EBLINK');
    blinks.eblink.msgs = content(blinks.eblink.locations);
    %disp(blinks.eblink.msgs{1});
    %-
    %example of the trial MSG:
    %1     2     3       4      5     
    %EBLINK eye   stime	etime	dur	  
    %-
    %
    blinks.eblink.eye = cellfun(@(x) get_event_content(x,2,2), blinks.eblink.msgs);
    %disp(blinks.eblink.eye{1});
    blinks.eblink.stime = cellfun(@(x) get_event_content(x,3,3), blinks.eblink.msgs);
    %disp(blinks.eblink.stime{1});
    blinks.eblink.etime = cellfun(@(x) get_event_content(x,4,4), blinks.eblink.msgs);
    %disp(blinks.eblink.etime{1});
    blinks.eblink.dur = cellfun(@(x) get_event_content(x,5,5), blinks.eblink.msgs);
    %disp(blinks.eblink.dur{1});    
end
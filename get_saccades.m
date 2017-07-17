function saccades = get_saccades( content )
    %get start saccades:
    saccades.ssacc.locations = get_events_location(content,'SSACC');
    saccades.ssacc.msgs = content(saccades.ssacc.locations);
    %disp(saccades.ssacc.msgs{1});
    %-
    %example of the trial MSG:
    %1     2    3       
    %SSACC eye  stime
    %-
    %  
    saccades.ssacc.eye = cellfun(@(x) get_event_content(x,2,2), saccades.ssacc.msgs);
    %disp(saccades.ssacc.eye{1});
    saccades.ssacc.stime = cellfun(@(x) get_event_content(x,3,3), saccades.ssacc.msgs);
    %disp(saccades.ssacc.stime{1});
    %-
    %get end saccades:
    saccades.esacc.locations = get_events_location(content,'ESACC');
    saccades.esacc.msgs = content(saccades.esacc.locations);
    %disp(saccades.esacc.msgs{1});
    %-
    %example of the trial MSG:
    %1     2     3       4      5     6   7    8  9  10  11
    %ESACC eye   stime	etime	dur	  sx  sy   ex ey amp pv
    %-
    %
    saccades.esacc.eye = cellfun(@(x) get_event_content(x,2,2), saccades.esacc.msgs);
    %disp(saccades.esacc.eye{1});
    saccades.esacc.stime = cellfun(@(x) get_event_content(x,3,3), saccades.esacc.msgs);
    %disp(saccades.esacc.stime{1});
    saccades.esacc.etime = cellfun(@(x) get_event_content(x,4,4), saccades.esacc.msgs);
    %disp(saccades.esacc.etime{1});
    saccades.esacc.dur = cellfun(@(x) get_event_content(x,5,5), saccades.esacc.msgs);
    %disp(saccades.esacc.dur{1});
    saccades.esacc.sx = cellfun(@(x) get_event_content(x,6,6), saccades.esacc.msgs);
    %disp(saccades.esacc.sx{1});
    saccades.esacc.sy = cellfun(@(x) get_event_content(x,7,7), saccades.esacc.msgs);
    %disp(saccades.esacc.sy{1});
    saccades.esacc.ex = cellfun(@(x) get_event_content(x,8,8), saccades.esacc.msgs);
    %disp(saccades.esacc.ex{1});
    saccades.esacc.ey = cellfun(@(x) get_event_content(x,9,9), saccades.esacc.msgs);
    %disp(saccades.esacc.ey{1});
    saccades.esacc.amp = cellfun(@(x) get_event_content(x,10,10), saccades.esacc.msgs);
    %disp(saccades.esacc.amp{1});
    saccades.esacc.pv = cellfun(@(x) get_event_content(x,11,11), saccades.esacc.msgs);
    %disp(saccades.esacc.pv{1});
end
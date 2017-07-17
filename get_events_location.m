function events_location = get_events_location( events, event_str )
    % this returns 0 -> expression absent; 1 -> expression present
    events_location = ~cellfun('isempty',(regexp(events, event_str)));
    
    % using booleans, create a list of all indexes (locations) of events that
    % contain event_str expression
    % get locations 
    events_location = find(events_location == 1);
    
end
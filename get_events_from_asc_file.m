function events = get_events_from_asc_file( asc_file_content )
    %every single line in an ASC file is considered as a single event
    %get events from ASC file 
    events = regexp(asc_file_content, '\n', 'split');
end
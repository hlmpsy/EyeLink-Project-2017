function events = get_events_from_asc_file( asc_file_content, path, filename )
    %every single line in an ASC file is considered as a single event
    %get events from ASC file and save them on a MAT file
    events = regexp(asc_file_content, '\n', 'split');
    %disp([path '/' filename '.mat']);
    %save([path '/' filename '.mat'], 'events');
end
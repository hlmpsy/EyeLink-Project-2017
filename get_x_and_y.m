function [x, y] = get_x_and_y( content )
    %clean content from diagnostic MSGs starting with MSG
    %0 if there is 'MSG', 1 if there is not 'MSG'
    nomsg_locations = cellfun('isempty',(regexp(content, 'MSG')));
    nomsg_locations = find(nomsg_locations == 1);
    %disp(nomsg_locations);
    clean_content = content(nomsg_locations);
    %disp(clean_content);
    %example of the MSG:
    %1         2 3
    %timestamp x y
    x = cellfun(@(s) get_event_content(s,2,2), clean_content);
    x = cellfun(@str2double, x);
    y = cellfun(@(s) get_event_content(s,3,3), clean_content);
    y = cellfun(@str2double, y);
end
function fixations  = get_valid_fixations( fixations, blinks )
    %-
    %check if there are or not blinks in the current trial
    if isempty(blinks.sblink.locations)
        disp('No blinks in this trial');
        return;
    else
        %determine location of the FIX preceding and following a blink
        %get fixations locations cell array:
        %fixations.sfix.locations;
        %fixations.efix.locations;
        %copy to a temp cell array the sfix locations
        temp_sfix_locations = fixations.sfix.locations;
        %pop in the temp cell array the sblink locations
        temp_sfix_locations = [temp_sfix_locations blinks.sblink.locations];
        %sort temp_sfix_locations in ascending order
        temp_sfix_locations = sort(temp_sfix_locations);
        %-
        %copy to a temp cell array the efix locations
        temp_efix_locations = fixations.efix.locations;
        disp('1');
        disp(temp_efix_locations);
        %pop in the temp cell array the eblink locations
        temp_efix_locations = [temp_efix_locations blinks.eblink.locations];
        %sort temp_sfix_locations in ascending order
        temp_efix_locations = sort(temp_efix_locations);
        disp('2');
        disp(temp_efix_locations);
        %-
        %consider temp_sblinks_locations, then get the indices where the sblinks are
        temp_sblinks_locations_indices = [1:length(temp_sfix_locations)];
        temp_sblinks_locations_indices = temp_sblinks_locations_indices( ismember( temp_sfix_locations, blinks.sblink.locations ));
        %consider temp_eblinks_locations, then get the indices where the eblinks are
        temp_eblinks_locations_indices = [1:length(temp_efix_locations)];
        temp_eblinks_locations_indices = temp_eblinks_locations_indices( ismember( temp_efix_locations, blinks.eblink.locations ));
        disp(temp_eblinks_locations_indices);
        %-
        %for every blink do the following
        for ii = 1:length(temp_sblinks_locations_indices)
            %check if the blink is at the begin of the trial
            if temp_sblinks_locations_indices(ii) == 1
                continue;
            %check if the blink is at the end of the trial 
            elseif temp_sblinks_locations_indices(ii) == length(temp_sfix_locations)
                continue;
            end
            %-
            %get the location of the efix before the eblink in the vector
            %temp_eblinks_locations_indices
            disp('temp_efix_locations');
            disp(temp_efix_locations(temp_sblinks_locations_indices(ii)-1));
            disp(temp_efix_locations(temp_sblinks_locations_indices(ii)+1));
            %blink is after this fixation
            blink_after_loc = find(fixations.efix.locations == (temp_efix_locations(temp_sblinks_locations_indices(ii)-1)));
            %blink is before this fixation
            blink_before_loc = find(fixations.efix.locations == (temp_efix_locations(temp_sblinks_locations_indices(ii)+1)));
            disp('before');
            disp(blink_before_loc);
            fixations.efix.before(blink_before_loc) = 1;
            disp(fixations.efix.before);
            disp('after');
            disp(blink_after_loc);
            fixations.efix.after(blink_after_loc) = 1;
            disp(fixations.efix.after);
            disp(fixations.efix.locations);
            disp('-');
            %-
            %if the fixation that has a blink after last less than 100ms
            %then it is not a valid fixation
            if (fixations.efix.etime(blink_after_loc)-fixations.efix.stime(blink_after_loc) < 100)
                fixations.efix.valid(blink_after_loc) = 0; 
            end
            disp(fixations.efix.etime(blink_after_loc));
            disp(fixations.efix.stime(blink_after_loc));
            disp(fixations.efix.etime(blink_after_loc)-fixations.efix.stime(blink_after_loc));
            disp(fixations.efix.valid);
            %-
            %if the fixation that has a blink before last less than 100ms
            %then it is not a valid fixation
            if (fixations.efix.etime(blink_before_loc)-fixations.efix.stime(blink_before_loc) < 100)
                fixations.efix.valid(blink_before_loc) = 0;
            end
            disp(fixations.efix.etime(blink_before_loc));
            disp(fixations.efix.stime(blink_before_loc));
            disp(fixations.efix.etime(blink_before_loc)-fixations.efix.stime(blink_before_loc));
            disp(fixations.efix.valid);
        end
    end
end


function valid_fixations  = get_valid_fixations( fixations, blinks )
    %-
    %at the beginning suppose all fixations are valid
    valid_fixations = ones(1,length(fixations.sfix.locations));
    %check if there are or not blinks in the current trial
    if isempty(blinks.sblink.locations)
        return;
    else
%         disp("there are blinks");
%         disp(blinks.sblink.locations);
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
        %copy to a temp cell array the esaccades locations
        temp_efix_locations = fixations.efix.locations;
        %pop in the temp cell array the eblink locations
        temp_efix_locations = [temp_efix_locations blinks.eblink.locations];
        %sort temp_sfix_locations in ascending order
        temp_efix_locations = sort(temp_efix_locations);
        %-
        %consider temp_sblinks_locations, then get the indices where the sblinks are
        temp_sblinks_locations_indices = [1:length(temp_sfix_locations)];
        temp_sblinks_locations_indices = temp_sblinks_locations_indices( ismember( temp_sfix_locations, blinks.sblink.locations ));
        %consider temp_eblinks_locations, then get the indices where the eblinks are
        temp_eblinks_locations_indices = [1:length(temp_efix_locations)];
        temp_eblinks_locations_indices = temp_eblinks_locations_indices( ismember( temp_efix_locations, blinks.eblink.locations ));
        %-
        %initialize two empty vectors
        fixations_before_blink.sfix = [];
        fixations_after_blink.efix = [];
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
            %check if the fix before the blink last less than 100ms
            if (str2double(fixations.efix.etime{temp_eblinks_locations_indices(ii)-1})-str2double(fixations.efix.stime{temp_eblinks_locations_indices(ii)-1}) < 100)
                valid_fixations(temp_sblinks_locations_indices(ii)-1) = 0; 
            end
            %check if the fix after the blink last less than 100ms
            if (str2double(fixations.efix.etime{temp_eblinks_locations_indices(ii)+1})-str2double(fixations.efix.stime{temp_eblinks_locations_indices(ii)+1}) < 100)
                valid_fixations(temp_sblinks_locations_indices(ii)) = 0; 
            end
        end
    end
end


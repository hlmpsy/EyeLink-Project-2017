function saccades_with_blink = get_saccades_with_blink( saccades, blinks)
    %check if there are or not blinks in the current trial
    if isempty(blinks)
        return;
    end
    %determine location of the saccades with a blink inside
    %get saccades locations cell array:
    %saccades.ssacc.locations 
    %saccades.esacc.locations
    %copy to a temp cell array the ssaccades locations
    %disp(blinks.sblink.locations);
    %disp(saccades.ssacc.locations);
    temp_ssaccades_locations = saccades.ssacc.locations;
    %disp(length(temp_ssaccades_locations));
    %disp(temp_ssaccades_locations);
    %pop in the temp cell array the sblink locations 
    temp_ssaccades_locations = [temp_ssaccades_locations blinks.sblink.locations];
    %disp(length(temp_ssaccades_locations));
    %disp(sort(temp_ssaccades_locations));
    %sort temp_ssaccades_locations in ascending order
    temp_ssaccades_locations = sort(temp_ssaccades_locations);
    %-
    %copy to a temp cell array the esaccades locations
    %disp(blinks.eblink.locations);
    %disp(saccades.esacc.locations);
    temp_esaccades_locations = saccades.esacc.locations;
    %disp(length(temp_esaccades_locations));
    %disp(temp_esaccades_locations);
    %pop in the temp cell array the eblink locations
    temp_esaccades_locations = [temp_esaccades_locations blinks.eblink.locations];
    %disp(length(temp_esaccades_locations));
    %disp(sort(temp_esaccades_locations));
    temp_esaccades_locations = sort(temp_esaccades_locations);
    %-
    %consider temp_sblinks_locations, then get the indices where the sblinks are  
    temp_sblinks_locations_indices = [1:length(temp_ssaccades_locations)];
    temp_sblinks_locations_indices = temp_sblinks_locations_indices( ismember( temp_ssaccades_locations, blinks.sblink.locations ));
    %disp(temp_sblinks_locations_indices);
    %consider temp_eblinks_locations, then get the indices where the eblinks are
    temp_eblinks_locations_indices = [1:length(temp_esaccades_locations)];
    temp_eblinks_locations_indices = temp_eblinks_locations_indices( ismember( temp_esaccades_locations, blinks.eblink.locations ));
    %disp(temp_eblinks_locations_indices);
    %-
    %initialize the following two empty vectors
    %this vector will contain the indices of the ssacc with a sblink after
    %it
    saccades_with_blink.ssacc = [];
    %this vector will contain the indices of the esacc with a eblink before
    %it
    saccades_with_blink.esacc = [];
    %for every blink do the following
    for ii = 1:length(temp_sblinks_locations_indices)
        %check if the blink is at the begin of the trial and outside
        %every saccade
        if temp_sblinks_locations_indices(ii) == 1
            %disp('1st position');
            continue;
        %check if the blink is at the end of the trial and outside
        %every saccade    
        elseif temp_sblinks_locations_indices(ii) == length(temp_ssaccades_locations)
            %disp('last position');
            continue;
        end
        %if the blink is not at the beginning nor at the end, check if it
        %is inside a saccade and determine in which saccade
        temp_saccade_with_blink.ssacc = temp_ssaccades_locations(temp_sblinks_locations_indices(ii)-1);
        saccades_with_blink.ssacc = [saccades_with_blink.ssacc temp_saccade_with_blink.ssacc];
        temp_saccade_with_blink.esacc = temp_esaccades_locations(temp_eblinks_locations_indices(ii)+1);
        saccades_with_blink.esacc = [saccades_with_blink.esacc temp_saccade_with_blink.esacc];
    end
end
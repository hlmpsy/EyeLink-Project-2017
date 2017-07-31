function validity = check_validity_trial( trial_data, valid_fixations )
    %suppose the trial is valid
    validity = true;
    columns = results_matrix_columns();
    %-
    %if there is a blink before the last fixation and the last fixation
    %last less than 100ms then the trial is not valid
    if( valid_fixations(end) == 0 )
        validity = false;
        return;
    end
end
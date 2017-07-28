function result_matrix = save_results_in_matrix( trial_num, trial_data )
    %-
    %trial_data struct:
    %
    %trial_data.content
    %trial_data.asc_trial_number
    %trial_data.asc_real_number
    %trial_data.csv_real_number
    %trial_data.rtime
    %trial_data.stime
    %trial_data.fixations
    %trial_data.saccades
    %trial_data.blinks
    %-
    struct_elements = fieldnames(trial_data);
    %define columns:
    %columns. 
    result_matrix = cell(1);
    %headers
    for ii = 1:numel(struct_elements)
        result_matrix{1,ii} = struct_elements(ii);
    end 
    %disp(result_matrix);
    for ii = 1:numel(struct_elements)
        result_matrix{trial_num + 1,ii} = trial_data.(struct_elements{ii});
    end
    %disp(result_matrix{1,3});
    %disp(result_matrix{2,3});
    %disp(struct_elements(1));
    %disp(trial_data);
    %disp(trial_data.(struct_elements{1}));
end
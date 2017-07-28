function result_matrix = save_results_in_matrix( matrix, trial_num, trial_data )
    %-
    %trial_data complete structure:
    %
    %1 trial_data.content 
    %2 trial_data.asc_trial_number
    %3 trial_data.asc_real_number
    %4 trial_data.csv_real_number
    %5 trial_data.csv_ChosenNumber
    %6 trial_data.csv_rtime
    %7 trial_data.csv_ChosenX
    %8 trial_data.csv_ChosenY
    %9 trial_data.csv_pae
    %10 trial_data.csv_Condition
    %11 trial_data.csv_TrialNumPerCond
    %12 trial_data.csv_TrialNumber
    %13 trial_data.csv_order
    %14 trial_data.csv_subject_nr
    %15 trial_data.stime
    %16 trial_data.fixations
    %trial_data.fixations.sfix
    %trial_data.fixations.sfix.locations
    %trial_data.fixations.sfix.msgs
    %trial_data.fixations.sfix.eye
    %trial_data.fixations.sfix.stime
    %trial_data.fixations.efix
    %trial_data.fixations.efix.locations
    %trial_data.fixations.efix.msgs
    %trial_data.fixations.efix.eye
    %trial_data.fixations.efix.stime
    %trial_data.fixations.efix.etime
    %trial_data.fixations.efix.dur
    %trial_data.fixations.efix.x
    %trial_data.fixations.efix.y
    %trial_data.fixations.efix.aps
    %17 trial_data.saccades
    %trial_data.saccades.ssacc
    %trial_data.saccades.ssacc.locations
    %trial_data.saccades.ssacc.msgs
    %trial_data.saccades.ssacc.eye
    %trial_data.saccades.ssacc.stime
    %trial_data.saccades.esacc
    %trial_data.saccades.esacc.locations
    %trial_data.saccades.esacc.msgs
    %trial_data.saccades.esacc.eye
    %trial_data.saccades.esacc.stime
    %trial_data.saccades.esacc.etime
    %trial_data.saccades.esacc.dur
    %trial_data.saccades.esacc.sx
    %trial_data.saccades.esacc.sy
    %trial_data.saccades.esacc.ex
    %trial_data.saccades.esacc.ey
    %trial_data.saccades.esacc.amp
    %trial_data.saccades.esacc.pv
    %18 trial_data.blinks
    %trial_data.blinks.sblink
    %trial_data.blinks.sblink.locations
    %trial_data.blinks.sblink.msgs
    %trial_data.blinks.sblink.eye
    %trial_data.blinks.sblink.stime
    %trial_data.blinks.eblink
    %trial_data.blinks.eblink.locations
    %trial_data.blinks.eblink.msgs
    %trial_data.blinks.eblink.eye
    %trial_data.blinks.eblink.stime
    %trial_data.blinks.eblink.etime
    %trial_data.blinks.eblink.dur
    %-
    struct_elements = fieldnames(trial_data);
    %define columns:
    %columns. 
    %matrix = cell(1);
    %headers
%     [r, c] = size(matrix);
%     disp([r,c]);
    for ii = 1:numel(struct_elements)
        matrix{1,ii} = struct_elements(ii);
    end 
    for ii = 1:numel(struct_elements)
        matrix{trial_num + 1,ii} = trial_data.(struct_elements{ii});
    end
    result_matrix = matrix;
end
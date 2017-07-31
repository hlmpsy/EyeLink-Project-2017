function columns = results_matrix_columns()
    %-
    %information variables columns
    %1 content
    columns.content = 1;
    %2 asc_trial_number
    columns.asc_trial_number = 2;
    %3 asc_real_number
    columns.asc_real_number = 3;
    %4 csv_real_number
    columns.csv_real_number = 4;
    %5 csv_ChosenNumber
    columns.csv_ChosenNumber = 5;
    %6 csv_rtime
    columns.csv_rtime = 6;
    %7 csv_ChosenX
    columns.csv_ChosenX = 7;
    %8 csv_ChosenY
    columns.csv_ChosenY = 8;
    %9 csv_pae
    columns.csv_pae = 9;
    %10 csv_Condition
    columns.csv_Condition = 10;
    %11 csv_TrialNumPerCond
    columns.csv_TrialNumPerCond = 11;
    %12 csv_TrialNumber
    columns.csv_TrialNumber = 12;
    %13 csv_order
    columns.csv_order = 13;
    %14 csv_subject_nr
    columns.csv_subject_nr = 14;
    %15 stime
    columns.stime = 15;
    %16 fixations
    columns.fixations = 16;
    %17 saccades
    columns.saccades = 17;
    %18 blinks
    columns.blinks = 18;
    %19 valid column
    %-
    %results variables cloumns
    %they start after the last info variable 
    %columns.blinks + 1 valid
    columns.valid = columns.blinks + 1;
    %columns.valid + 1 last_fixation_x
    columns.last_fixation_x = columns.valid + 1;
    %columns.valid + 1 last_fixation_y
    columns.last_fixation_y = columns.valid + 2;
    %columns.valid + 1 last_fixation_real_num
    columns.last_fixation_real_num = columns.valid + 3;
    %columns.valid + 1 asc_pae
    columns.asc_pae = columns.valid + 4;    
end
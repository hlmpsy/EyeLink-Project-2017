function [ x_mean, y_mean ] = get_x_and_y_mean( content, last_sfix_loc, last_efix_loc )
    %GET_X_AND_Y_MEAN Summary of this function goes here
    %   Detailed explanation goes here
    %calculate the average x and y
    %disp(trials_data{ii}.fixations.sfix.locations);
    %content that has to be analysed
    current.content = content((last_sfix_loc + 1):(last_efix_loc-1));%loc or (last_efix_loc-1)
    %disp((last_sfix_loc + 1));
    %disp(last_efix_loc);
    %disp(current.content);
    [current.x, current.y] = get_x_and_y( current.content );
    %[num_rows, num_columns] = size(current.x);
    x_mean = mean(current.x);
    y_mean = mean(current.y);
    %for ii = 1:num_columns
    %    current.x_mean = mean(current.x(1:ii));
    %    current.y_mean = mean(current.y(1:ii));
    %    if (current.x_mean < 2000) && (current.x_mean > 1000) && (current.y_mean < 200)  && (current.y_mean > 100)
    %        disp(current.x_mean);
    %        disp(current.y_mean);
    %    end
    %end
    %current.x_mean = mean(current.x);
    %current.y_mean = mean(current.y);
    %disp(current.x_mean);
    %disp(current.y_mean);
end


function my_plot( content )
    %corners are topleft(x1,y1) bottomright(x2,y2) (see EyeLink Manual)
    %-
    %screen dimensions x1 y1 x2 y2 :
    %GAZE_COORDS 0.00 0.00 1680.00 1050.00
    %-
    %fixed AOI described as x1 y1 x2 y2 :
    %RECTANGLE 1 780 465 900 585 fix_center
    %RECTANGLE 2 780 925 900 1045 fix_under
    %RECTANGLE 3 0 0 1680 325 whole_line
	%RECTANGLE 4 -7 0 71 325 leftanchor
    %RECTANGLE 5 801 0 879 325 linecenter
	%RECTANGLE 6 1609 0 1687 325 rightanchor
	%RECTANGLE 7 567 925 687 1045 numberleft
	%RECTANGLE 8 993 925 1113 1045 numberright
	%RECTANGLE 9 743 895 936 1050 nonsymbolictarget
	%-
	%non fixed AOI described as x1 y1 x2 y2 :
	%RECTANGLE 10 1129 0 1207 325 AOIreal
	%RECTANGLE 11 265 0 343 325 AOIinverted
	%RECTANGLE 12 1051 0 1129 325 AOIunderestimation
	%RECTANGLE 13 1207 0 1285 325 AOIoverestimation
    %-
    %plot aoi
    %the following aoi don't change:
    %the whole screen
    screen = [0 0 1680 1050];
    %fix_center
    aoi_1 = [780 465 900 585];
    %fix under
    aoi_2 = [780 925 900 1045];
    %whole line
    aoi_3 = [0 0 1680 325];
    %leftanchor
    aoi_4 = [-7 0 71 325];
    %linecenter
    aoi_5 = [801 0 879 325];
    %rightanchor
    aoi_6 = [1609 0 1687 325];
    %numberleft
    aoi_7 = [567 925 687 1045];
    %numberright
    aoi_8 = [993 925 1113 1045];
    %nonsymbolictarget
    aoi_9 = [743 895 936 1050];
    %-
    %aoi 10 - 13 are different for different displayed number 
    %get aoi 10 
    aoi_10_location = get_events_location(content,'AOIreal');
    %disp(content{aoi_10_location});
    %-
    %example of the MSG:
    %1      2         3  4     5         6       7  8  9  10  11
    %MSG	timestamp !V IAREA RECTANGLE AOI_num x1 y1 x2 y2  AOI_name
    %-
    aoi_10 = get_event_content(content{aoi_10_location}, 7, 10 );
    aoi_10 = cellfun(@str2double,aoi_10);
    %disp(aoi_10);
    %get aoi 11
    aoi_11_location = get_events_location(content,'AOIinverted');
    %disp(content{aoi_11_location});
    aoi_11 = get_event_content(content{aoi_11_location}, 7, 10 );
    aoi_11 = cellfun(@str2double,aoi_11);
    %disp(aoi_11);
    %-
    %note: AOIreal and AOIinverted can coincide if the numbers are
    %sufficently near, i.e. 56 and 65
    %-
    %get aoi 12
    aoi_12_location = get_events_location(content,'AOIunderestimation');
    %disp(content{aoi_12_location});
    aoi_12 = get_event_content(content{aoi_12_location}, 7, 10 );
    aoi_12 = cellfun(@str2double,aoi_12);
    %disp(aoi_12);
    %get aoi 13
    aoi_13_location = get_events_location(content,'AOIoverestimation');
    %disp(content{aoi_13_location});
    aoi_13 = get_event_content(content{aoi_13_location}, 7, 10 );
    aoi_13 = cellfun(@str2double,aoi_13);
    %disp(aoi_13);    
    %-
    figure;
    %the whole screen
    %here the order matter: objects drawn before stay in background 
    plot_aoi( screen, 'EdgeColor', 'k');
    %fix_center
    plot_aoi( aoi_1, 'EdgeColor', 'b');
    %fix under
    plot_aoi( aoi_2, 'EdgeColor', 'b');
    %whole line
    plot_aoi( aoi_3, 'EdgeColor', 'r');
    %leftanchor
    plot_aoi( aoi_4, 'EdgeColor', 'y');
    %linecenter
    plot_aoi( aoi_5, 'EdgeColor', 'y');
    %rightanchor
    plot_aoi( aoi_6, 'EdgeColor', 'y');
    %numberleft
    plot_aoi( aoi_7, 'EdgeColor', 'k');
    %numberright
    plot_aoi( aoi_8, 'EdgeColor', 'k');
    %nonsymbolictarget
    plot_aoi( aoi_9, 'EdgeColor', 'g');
    %AOIinverted
    plot_aoi( aoi_11, 'EdgeColor', 'g');
    %AOIunderestimation
    plot_aoi( aoi_12, 'EdgeColor', 'c');
    %AOIoverestimation
    plot_aoi( aoi_13, 'EdgeColor', 'c');
    %AOIreal
    plot_aoi( aoi_10, 'EdgeColor', 'k');
    %-
    %reverse Y axis
    set(gca,'YDir','reverse');
end

function w = get_width(x1,x2)
    w = abs(x1-x2);
end

function h = get_heigth(y1,y2)
    h = abs(y1-y2);
end

function r = plot_aoi( aoi, o1, o2 )
    r = rectangle('Position',[aoi(1) aoi(2) get_width(aoi(1),aoi(3)) get_heigth(aoi(2),aoi(4))], o1, o2);
end
function [aois_num] = get_aois( x, y, content )
    aois_num = [];
    %determine in which aoi the gaze is
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
%     %-
%     %aoi 10 - 13 are different for different displayed number 
%     %get aoi 10 
%     aoi_10_location = get_events_location(content,'AOIreal');
%     %disp(content{aoi_10_location});
%     %-
%     %example of the MSG:
%     %1      2         3  4     5         6       7  8  9  10  11
%     %MSG	timestamp !V IAREA RECTANGLE aois_num x1 y1 x2 y2  AOI_name
%     %-
%     aoi_10 = get_event_content(content{aoi_10_location}, 7, 10 );
%     aoi_10 = cellfun(@str2double,aoi_10);
%     %disp(aoi_10);
%     %get aoi 11
%     aoi_11_location = get_events_location(content,'AOIinverted');
%     %disp(content{aoi_11_location});
%     aoi_11 = get_event_content(content{aoi_11_location}, 7, 10 );
%     aoi_11 = cellfun(@str2double,aoi_11);
%     %disp(aoi_11);
%     %-
%     %note: AOIreal and AOIinverted can coincide if the numbers are
%     %sufficently near, i.e. 56 and 65
%     %-
%     %get aoi 12
%     aoi_12_location = get_events_location(content,'AOIunderestimation');
%     %disp(content{aoi_12_location});
%     aoi_12 = get_event_content(content{aoi_12_location}, 7, 10 );
%     aoi_12 = cellfun(@str2double,aoi_12);
%     %disp(aoi_12);
%     %get aoi 13
%     aoi_13_location = get_events_location(content,'AOIoverestimation');
%     %disp(content{aoi_13_location});
%     aoi_13 = get_event_content(content{aoi_13_location}, 7, 10 );
%     aoi_13 = cellfun(@str2double,aoi_13);
%     %disp(aoi_13);
%     %-
    %aoi_1
    top_left = aoi_1(1:2);
    bottom_right = aoi_1(3:4);
    if (x > top_left(1)) && (x < bottom_right(1)) && (y > top_left(2)) && (y < bottom_right(2));
        aois_num = [aois_num 1];
    end
    %aoi_2
    top_left = aoi_2(1:2);
    bottom_right = aoi_2(3:4);
    if (x > top_left(1)) && (x < bottom_right(1)) && (y > top_left(2)) && (y < bottom_right(2));
        aois_num = [aois_num 2];
    end
    %aoi_3
    top_left = aoi_3(1:2);
    bottom_right = aoi_3(3:4);
    if (x > top_left(1)) && (x < bottom_right(1)) && (y > top_left(2)) && (y < bottom_right(2));
        aois_num = [aois_num 3];
    end
    %aoi_4
    top_left = aoi_4(1:2);
    bottom_right = aoi_4(3:4);
    if (x > top_left(1)) && (x < bottom_right(1)) && (y > top_left(2)) && (y < bottom_right(2));
        aois_num = [aois_num 4];
    end
    %aoi_5
    top_left = aoi_5(1:2);
    bottom_right = aoi_5(3:4);
    if (x > top_left(1)) && (x < bottom_right(1)) && (y > top_left(2)) && (y < bottom_right(2));
        aois_num = [aois_num 5];
    end
    %aoi_6
    top_left = aoi_6(1:2);
    bottom_right = aoi_6(3:4);
    if (x > top_left(1)) && (x < bottom_right(1)) && (y > top_left(2)) && (y < bottom_right(2));
        aois_num = [aois_num 6];
    end
    %aoi_7
    top_left = aoi_7(1:2);
    bottom_right = aoi_7(3:4);
    if (x > top_left(1)) && (x < bottom_right(1)) && (y > top_left(2)) && (y < bottom_right(2));
        aois_num = [aois_num 7];
    end
    %aoi_8
    top_left = aoi_8(1:2);
    bottom_right = aoi_8(3:4);
    if (x > top_left(1)) && (x < bottom_right(1)) && (y > top_left(2)) && (y < bottom_right(2));
        aois_num = [aois_num 8];
    end
    %aoi_9
    top_left = aoi_9(1:2);
    bottom_right = aoi_9(3:4);
    if (x > top_left(1)) && (x < bottom_right(1)) && (y > top_left(2)) && (y < bottom_right(2));
        aois_num = [aois_num 9];
    end
%     %aoi_10
%     top_left = aoi_10(1:2);
%     bottom_right = aoi_10(3:4);
%     if (x > top_left(1)) && (x < bottom_right(1)) && (y > top_left(2)) && (y < bottom_right(2));
%         aois_num = [aois_num 10];
%     end
%     %aoi_11
%     top_left = aoi_11(1:2);
%     bottom_right = aoi_11(3:4);
%     if (x > top_left(1)) && (x < bottom_right(1)) && (y > top_left(2)) && (y < bottom_right(2));
%         aois_num = [aois_num 11];
%     end
%     %aoi_12
%     top_left = aoi_12(1:2);
%     bottom_right = aoi_12(3:4);
%     if (x > top_left(1)) && (x < bottom_right(1)) && (y > top_left(2)) && (y < bottom_right(2));
%         aois_num = [aois_num 12];
%     end
%     %aoi_13
%     top_left = aoi_13(1:2);
%     bottom_right = aoi_13(3:4);
%     if (x > top_left(1)) && (x < bottom_right(1)) && (y > top_left(2)) && (y < bottom_right(2));
%         aois_num = [aois_num 13];
%     end
    return;
end


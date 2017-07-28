function result = aoi_3( x, y )
    %aoi_3: check if x and y are in AOI #3
    %define top left angle and bottom right angle for AOI #3
    top_left = [0, 0];
    bottom_right = [1680, 325];
    result = (x > top_left(1)) && (x < bottom_right(1)) && (y > top_left(2)) && (y < bottom_right(2));
end


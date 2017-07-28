function result = px2nol( x )
    %convert number on the line to pixel
    %every 16px a number
    %32px is the NL offset
    result = (x - 32) / 16;
end




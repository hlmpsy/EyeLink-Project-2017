function result = nol2px( x )
    %convert number on the line to pixel
    %every 16px a number
    %32px is the NL offset
    result = (16*x) + 32;
end


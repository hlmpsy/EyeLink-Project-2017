function result = get_pae( x , x_e )
    %pae: calc percentage absolute error
    %x is the exact value
    %x_e is the estimated value
    result = ( abs( x - x_e ) / x ) * 100;
end


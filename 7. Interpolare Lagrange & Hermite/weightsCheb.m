function w = weightsCheb(m)
    w = (-1).^[0:m].*sin((2.*[0:m]+1)*pi/(2*m+2));
end
function x = nodesCheb(m,a,b)
    x = cos((2.*[0:m]+1)*pi/(2*m+2))*1/2*(b-a)+1/2*(a+b);
end
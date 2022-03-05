function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Prealculeaza matricile Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale 
    % imaginii I pentru fiecare pixel al acesteia
    % =========================================================================
    
    % obtine dimensiunea imaginii
    [m n nr_colors] = size(I);
    
    % TODO: fa cast matricii I la double
    I=double(I);
    Ix=zeros(m,n);
    Iy=zeros(m,n);
    Ixy=zeros(m,n);
    % TODO: calculeaza matricea cu derivate fata de x Ix
    for y = 0 : m - 1
        for x = 0 : n - 1
            x;
            y;
            Ix(y+1,x+1)=fx(I,x+1,y+1); 
        endfor
    endfor
    % TODO: calculeaza matricea cu derivate fata de y Iy
    for y = 0 : m - 1
        for x = 0 : n - 1
            Iy(y+1,x+1)=fy(I,x+1,y+1); 
        endfor
    endfor
    % TODO: calculeaza matricea cu derivate fata de xy Ixy
    for y = 0 : m - 1
        for x = 0 : n - 1
            Ixy(y+1,x+1)=fxy(I,y+1,x+1); 
        endfor
    endfor
endfunction

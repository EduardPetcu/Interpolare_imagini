function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)
    % =========================================================================
    % Calculeaza coeficientii de interpolare bicubica pentru 4 puncte alaturate
    % =========================================================================

    % TODO: calculeaza matricile intermediare
    A1=[1,0,0,0;0,0,1,0;-3,3,-2,-1;2,-2,1,1];
    A3=transpose(A1);
    %A2=zeros(4,4);
    indici=[y1,x1,y2,x2];
    for i = 0 : 1
        for j = 0 : 1
            A2(i+1,j+1)=f(indici(1,i*2+1),indici(1,j*2+2));    
        endfor
     endfor
     for i = 0 : 1
        for j = 0 : 1
            A2(i+1,2+j+1)=Ix(indici(1,i*2+1),indici(1,j*2+2));    
        endfor
     endfor
     for i = 0 : 1
        for j = 0 : 1
            A2(2+i+1,j+1)=Iy(indici(1,i*2+1),indici(1,j*2+2));    
        endfor
     endfor
     for i = 0 : 1
        for j = 0 : 1
            A2(2+i+1,2+j+1)=Ixy(indici(1,i*2+1),indici(1,j*2+2));    
        endfor
     endfor
    % TODO: converteste matricile intermediare la double
    A2=transpose(double(A2));
    A1=double(A1);
    A3=double(A3);
    A=A1*A2*A3;
    % TODO: calculeaza matricea finala
    
endfunction
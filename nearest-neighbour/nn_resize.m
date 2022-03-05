
function R = nn_resize(I, p, q)
    % =========================================================================
    % Upscaling de imagine folosind algoritmul de interpolare nearest-neighbour
    % Transforma imaginea I din dimensiune m x n in dimensiune p x q
    % =========================================================================
    [m n nr_colors] = size(I);
    
    % converteste imaginea de intrare la alb-negru daca este cazul
    if nr_colors > 1
        R = -1;
        return
    endif
    % initializeaza matricea finala
    R = zeros(p, q);
    % Obs:
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va
    % deplasa.
    % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
    % si s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul de la 0 la n - 1!
    % TODO: calculeaza factorii de scalare
    sx=((q-1)/(n-1));
    sy=((p-1)/(m-1));
    % Obs: daca se lucreaza cu indici in intervalul [0, n - 1], ultimul
    % pixel al imaginii se va deplasa de la (m - 1, n - 1) la (p, q).
    % s_x nu va fi q ./ n
  
    % TODO: defineste matricea de transformare pentru redimensionare
    T=[sx 0;0 sy];
    TINV=inv(T);
    % TODO: calculeaza inversa transformarii
    % parcurge fiecare pixel din imagine
    % foloseste coordonate de la 0 la n - 1
    for y = 0 : p - 1
        for x = 0 : q - 1     
               %srcX = round( x / p * m );
               %srcY = round( y /q * n );
                T_p=TINV*[x;y];
                srcX=T_p(1,1);
                srcY=T_p(2,1);
                %srcX = min( srcX, m-1);
                %srcY = min( srcY, n-1);
                R(y+1,x+1)=I(round(srcY)+1,round(srcX)+1);
           endfor
         
             % TODO: aplica transformarea inversa asupra (x, y) si calculeaza
            % x_p si y_p din spatiul imaginii initiale

            % TODO: trece (xp, yp) din sistemul de coordonate de la 0 la n - 1 in
            % sistemul de coordonate de la 1 la n pentru a aplica interpolarea

            % TODO: calculeaza cel mai apropiat vecin

            % TODO: calculeaza valoarea pixelului din imaginea finala
    endfor

    % TODO: converteste matricea rezultat la uint8
    R = uint8(R);

endfunction

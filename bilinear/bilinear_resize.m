
function R = bilinear_resize(I, p, q)
    % =========================================================================
    % Upscaling de imagine folosind algoritmul de interpolare biliniara
    % Transforma imaginea I alb-negru din dimensiune m x n in dimensiune p x q
    % =========================================================================
    [m n nr_colors] = size(I);

    % initializeaza matricea finala
    R = zeros(p, q);
    %I=double(I);
    % daca imaginea e alb negru, ignora
    if nr_colors > 1
        R = -1;
        return
    endif

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
    % TODO: calculeaza inversa transformarii
    TINV=inv(T);
    % parcurge fiecare pixel din imagine
    % foloseste coordonate de la 0 la n - 1
    for y = 0 : p - 1
        for x = 0 : q - 1
            % TODO: aplica transformarea inversa asupra (x, y) si calculeaza
            % x_p si y_p din spatiul imaginii initiale
             T_p=TINV*[x;y];
             srcX=T_p(1,1)+1;
             srcY=T_p(2,1)+1;
             [x1 y1 x2 y2]=surrounding_points(n,m,srcX,srcY);
             a=bilinear_coef(double(I),x1,y1,x2,y2);
             %a=double(a);
             R(y+1,x+1)=a(1,1)+a(2,1)*(srcX)+a(3,1)*(srcY)+a(4,1)*(srcX)*(srcY);
             %ff=[(I(y1,x1)),(I(y2,x1));(I(y1,x2)),(I(y2,x2))];
             %ff=double(ff);
           %  a=bilinear_coef(I,x1,y1,x2,y2);
                %srcX = min( srcX, m-1);
                %srcY = min( srcY, n-1);
            %R(y+1,x+1)=a(1,1)+a(2,1)*y+a(3,1)*x+a(4,1)*x*y;
            % TODO: trece (xp, yp) din sistemul de coordonate de la 0 la n - 1 in
            % sistemul de coordonate de la 1 la n pentru a aplica interpolarea

            % TODO: afla punctele ce inconjoara punctul (xp, yp)

            % TODO: calculeaza coeficientii de interplare a

            % TODO: calculeaza valoarea interpolata a pixelului (x, y)
            % Obs: pentru scrierea in imagine, x si y sunt in coordonate de
            % la 0 la n - 1 si trebuie aduse in coordonate de la 1 la n
       
        endfor
    endfor
       R = uint8(R);
    % TODO: transforma matricea rezultat in uint8 pentru a fi o imagine valida
    
endfunction

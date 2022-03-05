function out = bilinear_2x2(f, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare biliniara pe imaginea 2x2 f cu puncte intermediare
    % echidistante.
    % f are valori cunoscute in punctele (1, 1), (1, 2), (2, 1) si (2, 2).
    % 
    % Parametrii:
    % - f = imaginea ce se doreste sa fie interpolata
    % - STEP = distanta dintre doua puncte succesive
    % =========================================================================


    % defineste coordonatele x si y ale punctelor intermediare
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;

    % afla nr. de puncte
    n = length(x_int);

    % cele 4 punctele incadratoare vor fi aceleasi pentru toate punctele din
    % interior
    x1 = y1 = 1;
    x2 = y2 = 2;
    f;
    % TODO: calculeaza coeficientii de interpolare biliniara folosind bilinear_coef
    f=double(f);
    a=bilinear_coef(f,x1,y1,x2,y2);
    % TODO: initializeaza rezultatul cu o matrice n x n plina de zero
    out=zeros(n,n);
    % parcurge fiecare pixel din imaginea finala
    for i = 0 : n-1
        for j = 0 : n-1
            out(i+1,j+1)=round(f(1,1)*(n-i-1)*(n-j-1)/(n-1)/(n-1) + f(1,2)*(n-i-1)*(j)/(n-1)/(n-1)
             + f(2,1)*(i)*(n-j-1)/(n-1)/(n-1) + f(2,2)*(i)*(j)/(n-1)/(n-1));
        endfor
    endfor
    
    out=uint8(out);
    % TODO: converteste rezultatul la uint8 pentru a ramane o imagine

endfunction

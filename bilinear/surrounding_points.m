function [x1 y1 x2 y2] = surrounding_points(n, m, x, y)
    % =========================================================================
    % Calculeaza cele 4 puncte ce contin in interior (x, y)
    % Primeste si dimensiunea unei imagini m x n, pentru a asigura ca nu se
    % iese din matrice.
    % =========================================================================
    
    % TODO: Calculeaza x1, y1, x2, y2
    x1=floor(x);
    y1=floor(y);
    x2=x1+1;
    y2=y1+1;
    if round(x) >= n 
       x2=n;
       x1=x2-1;
    endif
    if round(y) >= m
       y2=m;
       y1=y2-1; 
    endif
    % TODO: daca y se afla pe ultima linie, asigura ca y2 nu o sa iasa din
    % matrice (nu o sa fie m + 1 daca y1 = m)
    
    % TODO: analog daca x se afla pe ultima coloana

endfunction
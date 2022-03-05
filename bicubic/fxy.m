function r = fxy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x si y a lui f in punctul (x, y).
    % =========================================================================
    [m n nr_colors] = size(f);

    if x==1 || y==1 || y==n || x==m
       r=0;
    else
    r=(f(x-1,y-1)+f(x+1,y+1)-f(x+1,y-1)-f(x-1,y+1))/4;
    % TODO: calculeaza derivata
    end
endfunction
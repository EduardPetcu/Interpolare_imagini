function out = nn_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img a.i. aceasta sa fie de dimensiune p x q.
    % Imaginea img este colorata.
    % Practic, apeleaza de 3 ori functia nn pe fiecare canal al imaginii.
    % =========================================================================

    % TODO: extrage canalul rosu al imaginii
    canalRosu=img(:,:,1);
    % TODO: extrage canalul verde al imaginii
    canalVerde=img(:,:,2);
    % TODO: extrace canalul albastru al imaginii
    canalAlbastru=img(:,:,3);
    % TODO: aplica functia nn pe cele 3 canale ale imaginii
    canalRosu=nn_resize(canalRosu,p,q);
    canalVerde=nn_resize(canalVerde,p,q);
    canalAlbastru=nn_resize(canalAlbastru,p,q);
    % TODO: formeaza imaginea finala cu cele 3 canale de culori
    % Hint: functia cat
    out=cat(3,canalRosu,canalVerde,canalAlbastru);

endfunction

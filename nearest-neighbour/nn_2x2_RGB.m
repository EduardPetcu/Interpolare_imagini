function out = nn_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare nearest neighbour pe imaginea 2x2 img cu puncte
    % intermediare echidistante.
    % img este o imagine colorata RGB.
    % =========================================================================
    %IM=imread(img);
    % TODO: extrage canalul rosu al imaginii
    canalRosu=img(:,:,1);
    % TODO: extrage canalul verde al imaginii
    canalVerde=img(:,:,2);
    % TODO: extrace canalul albastru al imaginii
    canalAlbastru=img(:,:,3);
    % TODO: aplica functia nn pe cele 3 canale ale imaginii
    canalRosu=nn_2x2(canalRosu,STEP);
    canalVerde=nn_2x2(canalVerde,STEP);
    canalAlbastru=nn_2x2(canalAlbastru,STEP);
    % TODO: formeaza imaginea finala cu cele 3 canale de culori
    % Hint: functia cat
    out=cat(3,canalRosu,canalVerde,canalAlbastru);
endfunction

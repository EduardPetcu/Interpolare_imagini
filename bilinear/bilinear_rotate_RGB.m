function out = bilinear_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica interpolare bilineara pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
    % TODO: extrage canalul rosu al imaginii
    canalRosu=img(:,:,1);
    % TODO: extrage canalul verde al imaginii
    canalVerde=img(:,:,2);

    % TODO: extrace canalul albastru al imaginii
    canalAlbastru=img(:,:,3);

    % TODO: aplică rotația pe fiecare canal al imaginii
    canalRosu=bilinear_rotate(canalRosu,rotation_angle);
    canalVerde=bilinear_rotate(canalVerde,rotation_angle);
    canalAlbastru=bilinear_rotate(canalAlbastru,rotation_angle);
    % TODO: reconstruiește imaginea RGB finala (hint: cat)
    out=cat(3,canalRosu,canalVerde,canalAlbastru);
endfunction
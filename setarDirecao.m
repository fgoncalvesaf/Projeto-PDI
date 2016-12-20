function direcao = setarDirecao(imagem, i, j)

direcao = 0;

if imagem(i,j+2) == 0 && direcao ~= 4
    direcao = 1;
elseif imagem(i-2,j) == 0 && direcao ~= 3
    direcao = 2;
elseif imagem(i+2,j) == 0 && direcao ~= 2
    direcao = 3;
elseif imagem(i,j-2) == 0 && direcao ~= 1
    direcao = 4;
end

direcao;

end
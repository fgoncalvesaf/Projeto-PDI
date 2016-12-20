image = imread('caminho.png');
cinza = mat2gray(image);

i = 1;
x = 1;

%encontra um pixel apos o primeiro 0
%setar o ponto de vista do robo
while ~x==0
   x = cinza(i,1);
   i=i+1;
end

%posicao do robo
currenti = i;
currentj = 0;

%centro de visao inicial do robo
visaoi = currenti;
visaoj = currentj + 3;

%matriz de visao inicial do robo
visao = [0 0 0 0 0,
         0 0 0 0 0,
         0 0 0 0 0,
         0 0 0 0 0,
         0 0 0 0 0];

%visao inicial
for a = -2:2
    for b = -2:2
        visao(a+3, b+3) = cinza(visaoi + a, visaoj + b);
   end
end

%colocar o robo na linha
currenti = i;
currentj = 0;
direcao = 1;

%andar

while direcao ~= 0
    
    direcao = setarDirecao(cinza, currenti, currentj);
    
    if direcao == 1 
        [cinza, currenti, currentj] = frentePraDireita(cinza, currenti, currentj);
    elseif direcao == 2
        [cinza, currenti, currentj] = frentePraCima(cinza, currenti, currentj);
    elseif direcao == 3
        [cinza, currenti, currentj] = frentePraBaixo(cinza, currenti, currentj);
    elseif direcao == 4
        [cinza, currenti, currentj] = frentePraEsquerda(cinza, currenti, currentj);
    end
    
end

fprintf('O robo chegou no final do caminho.\n');

figure;
imshow(cinza);
impixelinfo;

function [caminho, i, j] = frentePraDireita(imagem, currenti, currentj)
caminho = imagem;

direita = [1 1 1 1 1,
           1 0 0 0 0,
           1 0 0 0 0,
           1 0 0 0 0,
           1 0 0 0 1];
       
esquerda = [1 1 1 1 1,
            0 0 0 0 1,
            0 0 0 0 1,
            0 0 0 0 1,
            1 0 0 0 1];
        
emFrente = [1 1 1 1 1,
            0 0 0 0 0,
            0 0 0 0 0,
            0 0 0 0 0,
            1 1 1 1 1];
        
%matriz de visao
visao = [0 0 0 0 0,
         0 0 0 0 0,
         0 0 0 0 0,
         0 0 0 0 0,
         0 0 0 0 0];
        
direita = imrotate(direita, -90);
esquerda = imrotate(esquerda, -90);

%ajuste
currentj = currentj + 1;
caminho(currenti, currentj) = 1;

visaoi = currenti;
visaoj = currentj + 3;

for a = -2:2
    for b = -2:2
        visao(a+3, b+3) = caminho(visaoi + a, visaoj + b);
   end
end

passos = 0;

%andar reto ate ver uma curva
while visao == emFrente
    currentj = currentj + 1;
    caminho(currenti, currentj) = 1;
    visaoi = currenti;
    visaoj = currentj + 3;
    for a = -2:2
       for b = -2:2
            visao(a+3, b+3) = caminho(visaoi + a, visaoj + b);
       end
    end
    passos = passos + 1;
end

%andar de passo em passo ate o canto
currentj = currentj + 1;
caminho(currenti, currentj) = 1;
visaoi = currenti;
visaoj = currentj + 3;
for a = -2:2
    for b = -2:2
         visao(a+3, b+3) = caminho(visaoi + a, visaoj + b);
    end
end
currentj = currentj + 1;
caminho(currenti, currentj) = 1;
visaoi = currenti;
visaoj = currentj + 3;
for a = -2:2
    for b = -2:2
         visao(a+3, b+3) = caminho(visaoi + a, visaoj + b);
    end
end
currentj = currentj + 1;
caminho(currenti, currentj) = 1;
visaoi = currenti;
visaoj = currentj + 3;
for a = -2:2
    for b = -2:2
         visao(a+3, b+3) = caminho(visaoi + a, visaoj + b);
    end
end
for i = 1:3
    currentj = currentj + 1;
    caminho(currenti, currentj) = 1;
end

%contou os passos e fez a curva
passos = passos + 5;
fprintf('seguirReto(); O robo andou %d centimetros.\n', passos);
if visao==direita
    fprintf('virarDireita(); O robo virou a direita.\n');
elseif visao==esquerda
    fprintf('virarEsquerda(); O robo virou a esquerda.\n');
end

caminho;
i = currenti;
j = currentj;
end
%Algoritmo Genetico--------------
%Author:Adelson Araujo Junior----
%adelsondias@live.com------------
%Author:Igor Mac�do--------------
%--------------------------------

%Variaveis do AG
geracoes=100;
tamanhoPopulacao=100;

%escolha do objetivo parcial
objetivoParcial = [-2 2];
centrox = objetivoParcial(1);
centroy = objetivoParcial(2);
%raio do objetivo parcial
r = 1;    

%declara��o de uma popula��o naquele objetivoParcial
pop = gerarPop(centrox,centroy,tamanhoPopulacao,r);

proximaGeracao = zeros(tamanhoPopulacao,2);
menorDist = zeros(tamanhoPopulacao,1);
bestGuy = zeros(tamanhoPopulacao,1);

%posi��o referente ao rob�
posicaoAtual = [-4.504 -4.535];

for i=1:geracoes
    
    %print populacao
    fprintf([num2str(i) '� Popula��o =     ' '\nX:  ' num2str(pop(:,1)') '\nY:  ' num2str(pop(:,2)') '\n\n' ]);
    
    %aptidao
    aptidaoVector = sqrt((pop(:,1)-posicaoAtual(1)).^2 + (pop(:,2)-posicaoAtual(2)).^2);
    
    %taxa de cruzamento 50%
    txcru = 0.5;
    
    for j = 1:floor(tamanhoPopulacao*txcru)
    
        %selecao
        [selecionado1, selecionado2] = selecaoTorneio(pop,aptidaoVector);
        
        %cruzamento
        filho = cruzamento(pop,selecionado1,selecionado2);
        proximaGeracao(j,:) = filho;
        
    end
    
    %enviar para a pr�xima gera��o aqueles que n�o cruzaram
    for k = int64(tamanhoPopulacao*txcru):(tamanhoPopulacao)
        proximaGeracao(k,:) = pop(k,:);
    end
    
    %Mutacao (taxaMuta��o 1%)
    taxaMutacao=0.01;
    forcaMutacao=1;
    nMutacao = floor(taxaMutacao*size(pop,1));
    for k=1:nMutacao
        indiceMutado = randi(size(pop,1));
        pop(indiceMutado) = pop(indiceMutado)+forcaMutacao;
    end
    
    %Repassando a pr�xima gera��o para nova itera��o
    pop = proximaGeracao;

    %Vetor de melhores individuos de cada gera��o
    [menorDist(i),bestGuy(i)] = min(aptidaoVector);
end

%Printando a popula��o final
fprintf(['Populacao Final:     \nX: ' num2str(pop(:,1)') '\nY:  ' num2str(pop(:,2)') '\n']);

menorDist(tamanhoPopulacao) %Melhor fitness
bestGuy(tamanhoPopulacao)   %Indice do sujeito de melhor fitness

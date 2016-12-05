%Selecao por torneio-------------
function [selecionado1, selecionado2] = selecaoTorneio(pop,aptidaoVector)
    tamanhoPopulacao = size(pop,1);
    
    competidor1 = randi(tamanhoPopulacao);
    competidor2 = randi(tamanhoPopulacao);
    aptidaoR = aptidaoVector;
    if(aptidaoR(competidor1)<aptidaoR(competidor2))
        selecionado1 = competidor1;
    else
        selecionado1 = competidor2;
    end
    
    competidor1 = randi(tamanhoPopulacao);
    competidor2 = randi(tamanhoPopulacao);
    aptidaoR = aptidaoVector;
    if(aptidaoR(competidor1)<aptidaoR(competidor2))
        selecionado2 = competidor1;
    else
        selecionado2 = competidor2;
    end
end
%-------------------------------
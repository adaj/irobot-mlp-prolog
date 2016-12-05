%Mutacao------------------------ 
function mutacao(pop,taxaMutacao,forcaMutacao)
    nMutacao = floor(taxaMutacao*size(pop,1));
    for k=1:nMutacao
        indiceMutado = randi(size(pop,1));
        pop(indiceMutado) = pop(indiceMutado)+forcaMutacao;
    end
end
%-------------------------------
%Gerar Populacao-----------------
function aptidaoResult = aptidao(pop,posicaoAtual)
    aptidaoResult = sqrt((pop(:,1)-posicaoAtual(1)).^2 + (pop(:,2)-posicaoAtual(2)).^2);
end
%--------------------------------
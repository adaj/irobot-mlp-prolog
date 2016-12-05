%Cruzamento pela média----------
function filho = cruzamento(populacao,pai1,pai2)
    filho = (populacao(pai1,:)+populacao(pai2,:))/2;
end
%-------------------------------
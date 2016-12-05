%Gerar Populacao-----------------
function pop = gerarPop(centrox,centroy,tamanhoPopulacao,r)
    pop = -r+(2*r)*rand(tamanhoPopulacao,2);
    pop(:,1) = round((pop(:,1)+centrox)*1000)/1000;
    pop(:,2) = round((pop(:,2)+centroy)*1000)/1000;
end
%--------------------------------
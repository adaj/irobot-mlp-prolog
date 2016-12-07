function [ aptidao ] = aptidaoFuction(objetivo, pop, sensors, position, orientation)
%APTIDAOFUCTION Summary of this function goes here
%   Detailed explanation goes here
    distParaObjetivo = sqrt((objetivo(1)-pop(:,1)).^2+(objetivo(2)-pop(:,2)).^2);
    aptidao = distParaObjetivo;
    [~, idx] = max(sensors);
    
    if (idx == 1)
        mpoint = [position(1)+sensors(idx)*cos(orientation+pi/2) position(2)+sensors(idx)*sin(orientation+pi/2)];
        dist = sqrt((mpoint(1)-pop(:,1)).^2+(mpoint(2)-pop(:,2)).^2);
    end
    if (idx == 2)
        mpoint = [position(1)+sensors(idx)*cos(orientation) position(2)+sensors(idx)*sin(orientation)];
        dist = sqrt((mpoint(1)-pop(:,1)).^2+(mpoint(2)-pop(:,2)).^2);
    end
    if (idx == 3)
        mpoint = [position(1)+sensors(idx)*cos(orientation-pi/2) position(2)+sensors(idx)*sin(orientation-pi/2)];
        dist = sqrt((mpoint(1)-pop(:,1)).^2+(mpoint(2)-pop(:,2)).^2);
    end
     
    
    aptidao = aptidao + dist.^2;
   
end


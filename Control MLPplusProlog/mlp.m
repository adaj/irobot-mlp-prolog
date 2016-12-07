%mlp
classdef mlp
    properties
        layers = perceptron
        row
        column
    end
    methods
        % creates the matrix that contains the mlp
        % receives an array that indicates the number of perceptrons per
        % layer
        function obj = mlp(perceptronperlayer,numberofinputs)
            if nargin > 0
                obj.row = max(perceptronperlayer);
                obj.column = length(perceptronperlayer);
                obj.layers(obj.row,obj.column) = perceptron;
                
                % concatenates the number of input with the number of
                % perceptrons per layer just so we can use only one "for" to
                % create a perceptron with the correct number of inputs for
                % each layer
                perceptronperlayer = [numberofinputs perceptronperlayer];
                
                % the first element above becomes the number of inputs plus the
                % bias, anf the following elements are the number of
                % perceptrons per layer
                
                for i = 1:obj.column
                    for j = 1:obj.row
                        
                        % ajust the indice so we get the correct number of
                        % neurons for that specific layer
                        if (j <= perceptronperlayer(i+1))
                            
                            % ajusts the indice of perceptronperlayer(i) so
                            % we get the number of outputs from the last
                            % layer of interest
                            obj.layers(j,i) = perceptron(perceptronperlayer(i)+1); %+1 for the bias input
                            obj.layers(j,i).active = true;
                            if i == obj.column
                                obj.layers(j,i).lastlayer = true;
                            end
                        end
                    end
                end
            end
        end
        
        function [outmx,dmx] = activate(obj,inputs)
            outmx(obj.row,obj.column) = 0;%this matrix records the output of each perceptron
            dmx(obj.row,obj.column) = 0;%this matrix records the derivative of each perceptron
            
            %Calculates the output for the first layer of perceptron;
            % it is done apart because it might have a different number of
            % inputs than that of neurons in the first layer. (and the
            % algorithm of the next "for" wouldn't work
            for i = 1:obj.row
                if obj.layers(i,1).active
                    [outmx(i,1), dmx(i,1)] = obj.layers(i,1).activate([-1;inputs]); %[-1;inputs] includes the bias in the input
                end
            end
            
            for i = 2:obj.column
                for j = 1:obj.row
                    if (obj.layers(j,i).active)
                         % adds the bias in the input
                        [outmx(j,i), dmx(j,i)] = obj.layers(j,i).activate([-1;outmx(:,i-1)]);
                    end
                end
            end
        end
    end
end
classdef perceptron
    properties %(SetAccess=public,GetAccess=public)
        weights
        active = false
        lastlayer = false
    end
    
    methods
        function obj = perceptron(NumberOfInputs)
            if nargin > 0 
                obj.weights = rand(NumberOfInputs,1);
            end
        end
        %Feed foward / inputs is a column vector
        function [output, d] = activate(obj,inputs)
            weightedSum = obj.calculateWeightedSum(inputs);
            [output, d] = obj.activationFunction(weightedSum);
        end
        
        %Activation function receives a double to classify
        function [r, d] = activationFunction(obj,wSum)
            if obj.lastlayer == false
                r = tanh(wSum);
                d = (1-tanh(wSum)^2);
            else
                if wSum > 0
                    r = wSum;
                    d = 1;
                else
                    r = 0;
                    d = 0;
                end
            end
        end
        
        %Input should be a column vector with the inputs
        function weightedSum = calculateWeightedSum(obj,inputs) 
            weightedSum = 0;
            % in the mpl algorithm, the number of weights is always correct
            % while the number of inputs might come greater than necessary
            % from the last layer
            for n = 1:size(obj.weights,1) 
                weightedSum = weightedSum + obj.weights(n)*inputs(n);
            end
        end
    end
end
        
       
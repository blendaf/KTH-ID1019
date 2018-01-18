defmodule InsertionSort do
    def insert(element, []) do
        [element]    
    end
    def insert(element, [head|tail]) when head >= element do
        [element, head|tail]
    end
    def insert(element, [head|tail]) do 
        [head | insert(element, tail)]      
    end

    def isort([], sorted) do 
        []
    end
end
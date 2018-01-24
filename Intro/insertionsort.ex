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

    def isort([]) do [] end
    def isort([head|tail]) do 
       insert(head, isort(tail))
    end

    def isort([], sorted) do sorted end 
    def isort([head|tail], sorted) do
        insert(head, isort(tail, sorted))
    end 
end

IO.puts inspect(InsertionSort.isort([1, 3, 6, 2, 4, 6], [1, 2, 3]))

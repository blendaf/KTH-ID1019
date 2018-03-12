defmodule MergeSort do

    
    def split([], left, right), do {left, right} end
    def split([head|tail], left, right) do
        split(tail, [head|right], left)
    end 

    def merge([],right) do right end 
    def merge(left, []) do left end  
    def merge([hL|tL], [hR|_tR] = right) when hL < hR do 
        [hL|merge(tL,right)]
    end
    def merge([_hL|_tL] = left, [hR|tR]) do 
        [hR|merge(tR, left)]
    end

    def mergesort([]) do [] end 
    def mergesort([element]), do: [element]
    def mergesort(l) do
        {left, right} = split(l, [], [])
        merge(mergesort(left), mergesort(right))
    end 
   
end

IO.puts inspect(MergeSort.mergesort([1, 3, 6, 2, 4, 6]))

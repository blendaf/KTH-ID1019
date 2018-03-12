defmodule Introduction do

    def product(0,_) do
        0
    end 
    def product(m,n) do 
        n + product(m-1, n)
    end 

    def exp(_, 0) do 1 end
    def exp(x, n) do 
        product(exp(x, n-1), x)
    end

    def fastexp(x,1) do x end
    def fastexp(x, n) when rem(n,2) == 0 do 
        fastexp(x, div(n, 2)) * fastexp(x, div(n, 2))
    end     
    def fastexp(x, n) when rem(n,2) != 0 do
        fastexp(x, n-1) * x
    end 

    def nth(_, []) do [] end
    def nth(0, [head|_]) do head end 
    def nth(n, [_|tail]) do 
        nth(n-1, tail)
    end 


    def len([]) do 0 end 
    def len([_|tail]) do 
        1 + len(tail)
    end 

    def sum([]) do 0 end 
    def sum([head|tail]) do
        head + sum(tail)
    end

    def duplicated([]) do [] end 
    def duplicated([head|tail]) do
        [head, head| duplicated(tail)]
    end 

    def add(x, []) do [x] end
    def add(x, [x|tail]) do 
        [x|tail]
    end 
    def add(x, [head|tail]) do
       [head|add(x, tail)]
    end 

    def remove(_, []) do [] end
    def remove(x, [x|tail]) do 
        remove(x, tail)
    end 
    def remove(x, [head|tail]) do 
        [head|remove(x, tail)]
    end 

    def unique([]) do [] end 
    def unique([head|tail]) do 
        add(head, unique(tail))
    end 

    def pack([]) do [] end 
    def pack([head|tail]) do 
       packInsert(head, pack(tail)) 
    end 

    def packInsert(elem, []) do [[elem]] end 
    def packInsert(elem, [[elem|t]|tail]) do
        [[elem, elem|t]|tail]
    end 
    def packInsert(elem, [head|tail]) do
        [head|packInsert(elem, tail)]
    end 

    def reverse(l) do reverse(l, []) end
    def reverse([], res) do res end 
    def reverse([head|tail], res) do 
       reverse(tail, [head|res])
    end 

    def insert(element, []) do [element] end 
    def insert(element, [head|tail]) when element > head do [head|insert(element, tail)] end
    def insert(element, l) do [element|l] end  

    def isort([]) do [] end 
    def isort([head|tail]) do 
        insert(head, isort(tail))
    end 

    def mergeSort([]) do [] end 
    def mergeSort([element]) do [element] end 
    def mergeSort(l) do 
        {left, right} = split(l, [], [])   
        merge( mergeSort(left), mergeSort(right))
    end 

    def split([], left, right) do {left, right} end 
    def split([head|tail], left, right) do 
        split(tail, [head|right], left)
    end

    def merge(left, []) do left end
    def merge([], right) do right end  
    def merge([hl|tl], [hr|_tr] = right) when hl < hr do
        [hl|merge(tl, right)]
    end 
    def merge(left, [hr|tr]) do 
        [hr|merge(tr, left)]
    end  
    


    def bench() do
        ls = [16, 32, 64, 128, 256, 512]
        n = 100
        # bench is a closure: a function with an environment.
        bench = fn(l) ->
            seq = Enum.to_list(1..l)
            tn = time(n, fn -> reverse(seq) end)
            # tr = time(n, fn -> reverse(seq) end)
            :io.format("length: ~10w rev: ~8w us~n", [l, tn])
        end

        # We use the library function Enum.each that will call
        # bench(l) for each element l in ls
        Enum.each(ls, bench)
    end
    
    # Time the execution time of the a function.
    def time(n, fun) do
        start = System.monotonic_time(:milliseconds)
        loop(n, fun)
        stop = System.monotonic_time(:milliseconds)
        stop - start
    end

    # Apply the function n times.
    def loop(n, fun) do
        if n == 0 do
            :ok
        else
            fun.()
            loop(n - 1, fun)
        end
    end


    def toBinary(0) do [0] end 
    def toBinary(n) do toBinary(n, []) end
    def toBinary(0, b) do b end 
    def toBinary(n, b) do 
        toBinary(div(n, 2), [rem(n, 2)|b])
    end 

    def toInteger(b) do 
        toInteger(b,0)
    end 
    def toInteger([], n) do n end
    def toInteger([head|tail], n) when head != 0 do 
        toInteger(tail, n*2 + 1)
    end
    def toInteger([head|tail], n) do 
        toInteger(tail, n*2)
    end  


    def fib(0) do 0 end
    def fib(1) do 1 end
    def fib(n) do 
        fib(n-1) + fib(n-2)
    end 

    def fastFib(0) do {0, nil} end 
    def fastFib(1) do {1, 0} end
    def fastFib(n) do 
        {n1, n2} = fastFib(n-1)
        {n1+n2, n1}
    end 

end
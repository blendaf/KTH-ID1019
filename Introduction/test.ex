defmodule Test do 
    def double(n) do
        2 * n
    end


    def fahrenheit(f) do
        (f-32)/1.8
    end


    def area(l,b) do  
        l*b
    end
    

    def square(s) do    
        area(s,s)
    end


    def circle(r) do   
        square(r) * :math.pi()
    end


    def product(0,_) do 0 end
    def product(m,n) do 
        product(m-1, n) + n
    end


    def exp(_,0) do 1 end
    def exp(x,y) do
        product(exp(x,y-1), x)
    end


    def fastexp(x, 1) do x end
    def fastexp(x, y) when rem(y, 2) == 0  do 
        fastexp(x, div(y, 2)) * fastexp(x, div(y, 2))
    end
    def fastexp(x,y) do
        fastexp(x, y-1) * x
    end

    def nth(n, l) when n == 0 do 
        hd l    
    end
    def nth(n, l) do
        [_head|tail] = l 
        nth(n-1, tail) 
    end

    def len([]) do 0 end 
    def len(l) do
        [_head|tail] = l 
        len(tail) + 1
    end

    def sum([]) do 0 end
    def sum(l) do
        [head|tail] = l
        sum(tail) + head
    end 
  
    def duplicate([]) do [] end 
    def duplicate(l) do 
        [head|tail] = l
        [head, head | duplicate(tail)]
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
        packinsert(head,pack(tail))
    end 
    
    def packinsert(element, []) do 
         [[element]]
    end 
    def packinsert(element, [[element|t]|tail]) do 
        [[element, element|t]|tail]    
    end
    def packinsert(element, [head|tail]) do 
        [head|packinsert(element,tail)]
    end  
    
end

# IO.puts inspect(Test.sum([1, 3, 5]))
# IO.puts inspect(Test.len([1, 3, 5]))
# IO.puts inspect(Test.duplicate([1, 3, 5]))
# IO.puts inspect(Test.add(5, [1, 3, 5]))
# IO.puts inspect(Test.remove(5, [1, 3, 5]))
# IO.puts inspect(Test.unique([5, 1, 3, 5]))
IO.puts inspect(Test.pack([:a,:b,:b,:a,:c,:c]))

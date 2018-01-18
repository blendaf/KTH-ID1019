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
        [head|tail] = l 
        nth(n-1, tail) 
    end

    def len(l) do
        lenvar(0, l)
    end 
    def lenvar(n,[]) do n end  
    def lenvar(n, l) do 
        [head|tail] = l 
        lenvar(n+1, tail)
    end 

    def sum(l) do
        sumvar(0, l)       
    end 
    def sumvar(s, []) do s end
    def sumvar(s, l) do
        [head|tail] = l
        sumvar(s+head, tail)
    end
    
    def duplicate(l) do
        duplicatelist(l, copy)
    end
    def duplicatelist(l, copy) do
        
    end
end

defmodule Exam  do

    # def freq(key, []) do {key, 1} end 
    # def freq(key, [{key, f}|rest]) do [{key, f+1}|rest] end
    # def freq(key, [h|rest]) do freq(key, rest) end 
    
    # def fraq([]) do []end 
    # def fraq([key|rest]) do 
    #     freq(h,fraq(rest))
    # end


    # def new() do (:queue, [], []) end

    # def enqueue(elem, {:queue, front, back}) do
    #     {:queue, front,[elem|back]}     
    # end 

    # def dequeue({:queue, [], []}) do :fail end
    # def dequeue({:queue, [elem|rest], last}) do 
    #   {:ok, elem, {:queue, rest, last}}
    # end 
    # def dequeue({:queue, [], last}) do 
    #     [elem|rest] = last.reverse
    #     {:ok, elem, {:queue, rest, []}}
    # end  

    def eval([]) do 0 end
    def eval(["+", h| tail]) do 
        h + eval(tail)
    end
    def eval(["-", h | tail]) do 
        -h + eval(tail)
    end 
    def eval([h|tail]) do h + eval(tail) end 

    def reduce([]) do [] end
    def reduce([h1, h2|rest]) when h1 == h2 do reduce([h1|rest]) end  
    def reduce([h1|rest]) do [h1|reduce(rest)] end 

    def endcode([]) do [] end
    def endcode([h|t]) when h <= 99 do 
        res = 122-(99-h)
        [res|t]
    end
    def encode([h|t]) do 
        [h-3|t]
    end   

    def triss([{_,_,x} = h|t] = list) do 
        l = Enum.filter(t, fn({_,_,v}) -> x==v end)
        case L

end
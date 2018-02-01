defmodule Env do

    def new() do [] end

    def add(id, str, env) do [{id, str}|env]  end 

    def lookup(_, []) do nil end 
    def lookup(id, [{id, _} = head|_]) do head end
    def lookup(id, [_|tail]) do lookup(id, tail) end

    def lookrmv(_, []) do [] end 
    def lookrmv(id, [{id, _}|tail]) do lookrmv(id, tail) end 
    def lookrmv(id, [head|tail]) do
        [head|lookrmv(id, tail)] 
    end 

    def remove([], env) do env end 
    def remove([id1|rest], env) do 
        newEnv = lookrmv(id1, env)
        remove(rest, newEnv)
    end
    
end


# IO.puts inspect(Env.lookrmv(:a, [{:a, 1}, {:x, 5}, {:a, 4}]))
# IO.puts inspect(Env.lookrmv(:b, [{:a, 1}, {:x, 5}, {:a, 4}]))
# IO.puts inspect(Env.lookrmv(:a, [{:b, 1}, {:x, 5}, {:b, 4}]))
# IO.puts inspect(Env.remove([:a], [{:a, 1}, {:x, 5}, {:a, 4}]))
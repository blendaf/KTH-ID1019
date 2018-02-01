defmodule Env do

def new() do [] end

def add(id, str, env) do [{id, str}|env]  end 

def lookup(id, []) do nil end 
def lookup(id, [{identity, _} = head|tail]) when id == identity do head end
def lookup(id, [head|tail]) do lookup(id, tail) end

# def remove(ids, env) do end 

    
end

# IO.puts inspect(Env.())
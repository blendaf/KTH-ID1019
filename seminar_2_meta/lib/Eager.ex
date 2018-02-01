defmodule Eager do

    
    def eval_expr({:atm, id}, env) do 
       Env.add(id, :atm, env)
       {:ok, id}
    end

    def eval_expr({:var, id}, env) do 
        case Env.lookup(id, env) do 
            nil -> :error

            {_, str} -> {:ok, str}
        end      
    end 

    def eval_expr({:cons, {type1, id1}, {type2, id2} }, env) do 
        case eval_expr( {type1, id1}, env) do 
            :error -> :error
           
            {:ok, str1} ->  
                case eval_expr({type2, id2}, env) do 
                     :error -> :error

                    {:ok, ts} -> {str1, ts}
                end
        end
    end

    def eval_match(:ignore, ..., ...) do 
        {:ok, ...}
    end 

    def eval_match({:atm, id}, ..., ...) do 
        {:ok, ...}
    end 
end
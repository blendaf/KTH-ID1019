defmodule Driver do 

   
    def driver() do 
        # IO.puts inspect Env.lookup(:foo, Env.add(:foo, 42, Env.new()))
        # IO.puts inspect Eager.eval_expr({:atm, :a}, [])
        # IO.puts inspect Eager.eval_expr({:var, 54}, [])
        # IO.puts inspect Eager.eval_expr({:var, :x}, [{:x, :a}])
        IO.puts inspect Eager.eval_expr({:cons, {:var, :x}, {:atm, :b}}, [{:x, :a}])
    end
   
    def start(_type, _args) do 
        Task.start(fn -> driver() end)
    end

end 

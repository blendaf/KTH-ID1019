defmodule Sesame do
    
    def sesam() do 
        spawn_link(fn() -> closed() end)
    end


    def closed() do
        receive do
            :s -> s()
            _ -> closed()

        end 
    end 

     def s() do 
        IO.puts "In state s"
        receive do 
            :s -> s()
            :e -> se()
        end 
    end 


    def se() do 
        IO.puts "In state se"
        receive do 
            :s -> ses()
            _ -> closed()
        end 
    end

    def ses() do 
        IO.puts "In state ses"
        receive do 
            :a -> sesa()
            :e -> se()
            :s -> s()
        end 
    end 

    def sesa() do
        IO.puts "In state sesa"
        receive do 
            :m -> open()
        end
    end 

    def open() do
        :done
    end 
   
end 
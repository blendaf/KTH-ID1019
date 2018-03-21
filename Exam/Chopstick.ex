defmodule Chopstick do 

    def start() do 
        stick = spawn_link(fn -> available() end)  
    end 

    def available() do
        receive do
            {:request, from} ->
                send(from, {:granted, self()})
                gone()
            :quit -> :ok
        end
    end

    def gone() do
        receive do
            :return -> available()
            :quit -> :ok
        end
    end


    def request(left, right, timeout) do
        send(left, {:request, self()})
        send(right, {:request, self()})
        wait(left, right, timeout)
    end

    def wait(true, true, _) do 
        :ok
    end 
    def wait(left, right, timeout) do 
        receive do
            {:granted, left} -> wait(true, right, timeout)
            {:granted, right} -> wait(left, true, timeout)
            after timeout -> :no
        end
    end 

    def terminate(stick) do 
        send(stick, :quit)
    end 
    def return(stick) do 
        send(stick, :return)
    end 
end 



defmodule Philosopher do 

    def start(hunger, right, left, name, ctr, timeout) do 
        philosopher = spawn_link(fn -> dreaming(hunger, right, left, name, ctr, timeout) end)
    end 

    def dreaming(0, _, _, name, ctr, _) do 
        IO.puts("#{name} is done")
        send(ctr, :done)
    end 
    def dreaming(hunger, right, left, name, ctr, timeout) do 
        sleep(500)
        Chopstick.request(left, right, timeout)
        IO.puts("#{name} received chopsticks!")
        eating(hunger, right, left, name, ctr, timeout)
    end 

    def eating(hunger, right, left, name, ctr, timeout) do 
        sleep(2000)
        Chopstick.return(left)
        Chopstick.return(right)
        IO.puts("#{name} has eaten!")
        dreaming(hunger-1, right, left, name, ctr, timeout)
    end 

    def sleep(0) do :ok end
    def sleep(t) do
        :timer.sleep(:rand.uniform(t))
    end
    
end 

defmodule Dinner do 

    def start() do 
        seed = 4
        # seed = :erlang.now()
        spawn(fn -> init(seed) end) 
    end 
    
    def init(seed) do
        c1 = Chopstick.start()
        c2 = Chopstick.start()
        c3 = Chopstick.start()
        c4 = Chopstick.start()
        c5 = Chopstick.start()
        ctrl = self()
        Philosopher.start(5, c1, c2, "Arendt", ctrl, seed + 1)
        Philosopher.start(5, c2, c3, "Hypatia", ctrl, seed + 2)
        Philosopher.start(5, c3, c4, "Simone", ctrl, seed + 3)
        Philosopher.start(5, c4, c5, "Elisabeth", ctrl, seed + 4)
        Philosopher.start(5, c5, c1, "Ayn", ctrl, seed + 5)
        wait(5, [c1, c2, c3, c4, c5])
    end

    def wait(0, chopsticks) do
        Enum.each(chopsticks, fn(c) -> Chopstick.terminate(c) end)
    end
    def wait(n, chopsticks) do
        receive do
            :done ->
                wait(n - 1, chopsticks)
            :abort ->
                Process.exit(self(), :kill)
        end
    end

end 

# left = Chopstick.start()
# right = Chopstick.start()
# Philosopher.start(4, left, right, "Kalle", self())



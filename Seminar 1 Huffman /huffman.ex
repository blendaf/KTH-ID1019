defmodule Huffman do
    def sample do
        'the quick brown fox jumps over the lazy dog
        this is a sample text that we will use when we build
        up a table we will only handle lower case letters and
        no punctuation symbols the frequency will of course not
        represent english but it is probably not that far off'
    end

    # def text, do: 'this is something we should encode'

    def test do
        sample = sample()
        tree(sample)
        # encode = encode_table(tree)
        # decode = decode_table(tree)
        # text = text()
        # seq = endoe(text, encode)
        # decode(seq, decode)
    end

    
    def freq(sample) do 
        freq = freq(sample, Map.new)
        freqList = Map.to_list(freq)
        List.keysort(freqList, 1)
    end
    def freq([], freq) do freq end 
    def freq([char|rest], freq) do 
        value = Map.get(freq, char, 0)
        freq(rest, Map.put(freq, char, value+1))
    end 

    def insert(node, []) do [node] end
    def insert({_, frequency} = node, [{_, f} = head| rest]) when frequency < f do
        [node, head | rest]
    end
    def insert(node, [head|tail]) do [head|insert(node, tail)] end
    
    def huffman([root]) do root end 
    def huffman([{c1, f1}, {c2, f2} | rest]) do
        huffman(insert({{c1, c2}, f1 + f2}, rest))
    end

    def tree(sample) do 
        freq = freq(sample)
        huffman(freq)
    end

    def collect(tree) do   
        
    end 
    def collect() do end 

    def encode_table(tree) do
        collect(tree)
    end

    # def decode_table(tree) do
    # end

    # def encode(text, table) do
    # end

    # def decode(seq, tree) do
    # end

end


# IO.puts inspect(Huffman.tree([:a, :b, :c, :d, :c, :c, :c, :e, :e]))
defmodule Huffman do 

    def sample do
        'the quick brown fox jumps over the lazy dog
        this is a sample text that we will use when we build
        up a table we will only handle lower case letters and
        no punctuation symbols the frequency will of course not
        represent english but it is probably not that far off'
    end

    # def text() do
    #     'this is something that we should encode'
    # end
    def test do
        # sample = sample()
        sample = 'foo'
        tree = tree(sample)
        encode = encode_table(tree)
        # decode = decode_table(tree)
        # text = text()
        # seq = encode(text, encode)
        # decode(seq, decode)
    end
    def tree(sample) do
        freq = freq(sample)
        huffman(freq)
    end

    def freq(sample) do 
        freq(sample, [])
    end
    def freq([], fList) do fList end 
    def freq([char|rest], fList) do
        freq(rest, fraq(char, fList))
    end 

    def fraq(char, []) do [{char, 1}] end 
    def fraq(char, [{char, freq}|rest]) do 
        [{char, freq+1}|rest]
    end 
    def fraq(char, [head|rest]) do 
        [head|fraq(char, rest)]
    end

    def huffman(freq) do 
        sortedList = Enum.sort(freq, fn({_, f1}, {_, f2}) -> f1 < f2 end)
        huffmanTree(sortedList) 
    end 

    def huffmanTree([root]) do root end 
    def huffmanTree([{c1, f1}, {c2, f2}|rest]) do 
        huffmanTree(insert({{c1, c2}, f1 + f2}, rest))
    end 

    # def insert(node, []) do [node] end
    # def insert({_, frequency} = node, [{_, f} = head| rest]) when frequency < f do
    #     [node, head | rest]
    # end
    # def insert(node, [head|tail]) do [head|insert(node, tail)] end

    
    def insert(node, []) do [node] end
    def insert({c1, f1} = node,[{c2, f2} = head|rest]) when f1 < f2 do 
        [node, head|rest]
    end 
    def insert(node, [head|rest]) do
        [head|insert(node, rest)] 
    end 

    def encode_table(tree) do
        code_table(tree, [])
    end 

   
    def code_table({c1, c2}, path) do 
        left = code_table(c1, [0 | path])
        right = code_table(c2, [1 | path])
        left ++ right
    end 
    def code_table(char, path) do [{char, Enum.reverse(path)}] end 
   




    # def decode_table(tree) do
        
    # end
    # def encode(text, table) do
        
    # end
    # def decode(seq, tree) do
       
    # end
    

    


end 

IO.puts inspect(Huffman.tree([:a, :b, :c, :d, :c, :c, :c, :e, :e]))
require "byebug"

p "DUOS"
def duos(str)
    count = 0
    i = 0
    while i < str.length
        if str[i] == str[i + 1]
            count += 1
        end
        i += 1
    end
    count
end

# Examples
p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0
p "DONE"
p "---------------"

p "SENTENCE_SWAP"
def sentence_swap(sentence, hash)
    words = sentence.split
    new_sen = []
    i = 0 
    while i < words.length
        if hash.has_key?(words[i])
            new_sen << hash[words[i]]
        else
            new_sen << words[i]
        end
        i += 1
    end
    new_sen.join(" ")
end

# Examples
p sentence_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'
p "DONE"
p "---------------"

p "HASH_MAPPED"
def hash_mapped(hash, prc1, &prc2)
    new_hash = {}
    hash.each do |k, v|
        new_hash[prc2.call(k)] = prc1.call(v)
    end
    new_hash
end

double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}
p "DONE"
p "---------------"

p "COUNTED_CHARACTERS"
def counted_characters(string)
    new_arr = []
    hash = Hash.new(0)
    string.each_char do |char|
        hash[char] += 1
    end
    hash.each do |k, v|
        new_arr << k if v > 2
    end
    new_arr
end

p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []
p "---------------"

p "TRIPLET_TRUE"
def triplet_true(string)
    i = 0
    while i < string.length
        if string[i] == string[i + 1] && string[i] == string[i + 2]
            return true
        end
        i += 1
    end
    false
end

# Examples
p triplet_true('caaabb')        # true
p triplet_true('terrrrrible')   # true
p triplet_true('runninggg')     # true
p triplet_true('bootcamp')      # false
p triplet_true('e')             # false
p "DONE"
p "---------------"

p "ENERGETIC_ENCODING"
def energetic_encoding(string, hash)
    # create a new string, implicitly return it
    # iterate over the string. 
    # if char == " " then += char
    # Check if hash.has_key?(char) y: new_str += hash val n: += ?
    new_str = ""
    string.each_char do |char|
        if char == " "
            new_str += char
        elsif hash.has_key?(char)
            new_str += hash[char]
        else
            new_str += "?"
        end
    end
    new_str
end

p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'
p "---------------"

p "UNCOMPRESS"
def uncompress(string)
end

uncompress('a2b4c1') # 'aabbbbc'
uncompress('b1o2t1') # 'boot'
uncompress('x3y1x2z4') # 'xxxyxxzzzz'
p "---------------"
# excercise one
def say_hello(name)
    return "Hello, #{name}"
end

# excerise two
def encode(plaintext, key)
    cipher = key.chars.uniq + (("a".."z").to_a - key.chars)
    ciphertext_chars = plaintext.chars.map { |char|
        (65 + cipher.find_index(char)).chr}
    return ciphertext_chars.join
end

# puts encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"

def decode(ciphertext, key)
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    print cipher.length
    plaintext_chars = ciphertext.chars.map do |char|
        cipher[char.ord - 65]
  end
  return plaintext_chars.join
end


# puts decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"

# challenge
def get_most_common_letter(text)
    counter = Hash.new(0)
    text.chars.each { |char|
        counter[char] += 1
    }
    counter_arr = counter.to_a.sort_by {|k, v| v }
    return counter_arr[-1][-1]  if counter_arr[-1][-2] != " "
    return counter_arr[-2][-2]
end

# Intended output:
# 
# print get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"

# debugging 2 challenge:
class LetterCounter
    def initialize(text)
      @text = text
    end
  
    def calculate_most_common()
      counter = Hash.new(0)
      most_common = nil
      most_common_count = 0
      @text.chars.each do |char|
        next unless is_letter?(char)
        counter[char] = (counter[char] || 1) + 1
        if counter[char] > most_common_count
          most_common = char
          most_common_count = 0
          most_common_count += counter[char]
        end
      end
      return [most_common_count, most_common]
    end
  
    private
  
    def is_letter?(letter)
      return letter =~ /[a-z]/i
    end
  end
  
  counter = LetterCounter.new("Digital Punk")
  p counter.calculate_most_common
  
  # Intended output:
  # [2, "i"]
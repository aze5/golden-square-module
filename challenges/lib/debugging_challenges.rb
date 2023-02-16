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

puts encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"

def decode(ciphertext, key)
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    plaintext_chars = ciphertext.chars.map do |char|
        cipher[char.ord - 65]
  end
  return plaintext_chars.join
end


puts decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"
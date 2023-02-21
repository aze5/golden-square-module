class StringRepeater
  def initialize(kernel)
    @io = kernel
  end

  def run
    @io.puts "Hello. I will repeat a string many times."
    @io.puts "Please enter a string."
    a = @io.gets.chomp
    @io.puts "Please enter a number of repeats."
    b = @io.gets.chomp
    @io.puts "Here is your result:"
    "#{a * b.to_i}"

  end
end
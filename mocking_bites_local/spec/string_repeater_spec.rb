require "string_repeater"

describe StringRepeater do
  it "repeats a string 10 times" do
    io = double :kernel
    str_repeat = StringRepeater.new(io)
    expect(io).to receive(:puts).with("Hello. I will repeat a string many times.")
    expect(io).to receive(:puts).with("Please enter a string.")
    expect(io).to receive(:gets) {"Hi"}
    expect(io).to receive(:puts).with("Please enter a number of repeats.")
    expect(io).to receive(:gets) {"10"}
    expect(io).to receive(:puts).with("Here is your result:")
    expect(str_repeat.run).to eq "Hi" * 10
    
  end

end
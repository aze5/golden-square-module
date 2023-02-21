require "interactive_calculator"

describe InteractiveCalculator do
  it "subtracts two numbers" do
    io = double :kernel
    expect(io).to receive(:puts).with("Hello. I will subtract two numbers.")
    expect(io).to receive(:puts).with("Please enter a number")
    expect(io).to receive(:gets) {"4"}
    expect(io).to receive(:puts).with("Please enter another number")
    expect(io).to receive(:gets) {"4"}
    expect(io).to receive(:puts).with("Here is your result:")
    interactive_calculator = InteractiveCalculator.new(io)
    expect(interactive_calculator.run).to eq "4 - 4 = 0"
  end
end
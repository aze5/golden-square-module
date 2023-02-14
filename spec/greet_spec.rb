require "greet"

RSpec.describe "greet method" do
    it "greets name entered as an argument" do
        result = greet("Ayoub")
        expect(result).to eq "Hello Ayoub!"
    end
end
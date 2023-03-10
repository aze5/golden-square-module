require "string_builder"

RSpec.describe StringBuilder do
    it "returns empty string before anything is added" do
        string = StringBuilder.new
        expect(string.output).to eq ""
    end

    it "returns hello when hello is added to @str letter by letter" do
        string = StringBuilder.new
        string.add("h")
        string.add("e")
        string.add("l")
        string.add("l")
        string.add("o")
        expect(string.output).to eq "hello"
    end

    it "returns 0 when size is called initially" do
        string = StringBuilder.new
        expect(string.size).to eq 0
    end

    it "string.size returns 5 when hello is added to @str" do
        string = StringBuilder.new
        string.add("hello")
        expect(string.size).to eq 5
    end
end

require "grammar_checker"

RSpec.describe "grammar_checker" do
    context "grammar_checker(text) method" do
        it "returns 'Your grammar is incorrect' when 'hello WORLD' is passed" do
            expect(grammar_checker("hello WORLD")).to eq "Your grammar is incorrect"
        end

        it "returns 'Good grammar!' when 'Hello WORLD!' is passed" do
            expect(grammar_checker("Hello WORLD!")).to eq "Good grammar!"
        end

        it "returns 'ERROR, your text is empty' when empty string is passed" do
            expect(grammar_checker("")).to eq "ERROR, your text is empty"
        end

        it "fails if nothing is passed" do
            expect { grammar_checker }.to raise_error(ArgumentError)
        end
    end
end
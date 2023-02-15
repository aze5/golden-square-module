require "grammar_checker"

RSpec.describe "grammar_checker" do
    context "grammar_checker(text) method" do
        it "returns 'Your grammar is incorrect' when 'hello WORLD' is passed" do
            expect(grammar_checker("hello WORLD")).to eq "Your grammar is incorrect"
        end
    end
end
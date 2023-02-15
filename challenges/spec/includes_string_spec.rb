require "includes_string"

RSpec.describe "includes_string" do
    context "includes_string(text) method" do
        it "returns '#TODO not found' when passed 'hello WORLD'" do
            expect(includes_string("hello WORLD")).to eq "#TODO not found"
        end

        it "returns '#TODO found at index: 12' when passed 'hello world #TODO'" do
            expect(includes_string("hello world #TODO")).to eq "#TODO found at index: 12"
        end

        it "returns '#TODO found at index: 6' when passed 'hello #TODO WoRLD'" do
            expect(includes_string("hello #TODO WoRLD")).to eq "#TODO found at index: 6"
        end

        it "returns '#TODO found at index: 11' when passed 'HELLO WORLD#TODO'" do
            expect(includes_string("HELLO WORLD#TODO")).to eq "#TODO found at index: 11"
        end
        
        it "returns '#TODO found at index: 0' when passed '#TODOhello WORLD!'" do
            expect(includes_string("#TODOhello WORLD!")).to eq "#TODO found at index: 0"
        end

        it "fails when passed nothing" do 
            expect{ includes_string }.to raise_error(ArgumentError)
        end
    end
end
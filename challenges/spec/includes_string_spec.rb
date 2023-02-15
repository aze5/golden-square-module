require "includes_string"

RSpec.describe "includes_string" do
    context "includes_string(text) method" do
        it "returns '#TODO not found' when passed 'hello WORLD'" do
            expect(includes_string("hello WORLD")).to eq "#TODO not found"
        end

        it "returns '#TODO found at index: 12' when passed 'hello world #TODO'" do
            expect(includes_string("hello world #TODO")).to eq "#TODO found at index: 12"
        end
    end
end
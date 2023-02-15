require "includes_string"

RSpec.describe "includes_string" do
    context "includes_string(text) method" do
        it "returns '#TODO not found' when passed 'hello WORLD'" do
            expect(includes_string("hello WORLD")).to eq "#TODO not found"
        end
    end
end
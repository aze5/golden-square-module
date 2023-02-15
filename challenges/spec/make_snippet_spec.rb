require "make_snippet"

RSpec.describe "make_snippet" do
    context "make_snippet(string) method" do
        it "returns hello... when 'hello' is passed into the argument" do
            expect(make_snippet("hello")).to eq "hello..."
        end
    end
end
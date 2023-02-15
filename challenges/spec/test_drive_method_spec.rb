require "test_drive_method"

RSpec.describe "methods" do
    context "make_snippet(string) method" do
        it "returns hi when 'hi' is passed into the argument" do
            expect(make_snippet("hi")).to eq "hi"
        end

        it "returns hello... when 'hello there!' is passed into the argument" do
            expect(make_snippet("hello there")).to eq "hello..."
        end
    end
end

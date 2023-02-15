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

    context "count_words(string) method" do
        it "returns 2 when passed hello world" do
            expect(count_words("hello world")).to eq 2
        end

        it "returns 5 when passed Hello world, I love ruby!" do
            expect(count_words("Hello word, I love ruby!")).to eq 5
        end
    end
end

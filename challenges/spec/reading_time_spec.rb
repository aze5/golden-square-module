require "reading_time"

RSpec.describe "reading_time" do
    context "reading_time(words) method" do
        it "returns 'less than one minute' when 100 words are passed as an argument" do
            words = "hi " * 100
            expect(reading_time(words)).to eq "less than one minute"
        end

        it "returns '60 minutes' when 12000 words are passed as an argument" do
            words = "hi " * 12000
            expect(reading_time(words)).to eq "60 minutes"
        end
    end
end
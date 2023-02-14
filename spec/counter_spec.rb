require "counter"

RSpec.describe Counter do
    it "initially returns 0" do
        counting = Counter.new
        expect(counting.report).to eq "Counted to 0 so far."
    end
    it "adds to the count when add() is used once" do
        counting = Counter.new
        counting.add(3)
        expect(counting.report).to eq "Counted to 3 so far."
    end
    it "returns sum when add() is used multiple times" do
        counting = Counter.new
        counting.add(3)
        counting.add(8)
        expect(counting.report).to eq "Counted to 11 so far."
    end
end
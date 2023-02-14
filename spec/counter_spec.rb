require "counter"

RSpec.describe Counter do
    it "adds to the count when add() is used" do
        counting = Counter.new
        counting.add(3)
        counting.add(8)
        expect(counting.report).to eq "Counted to 11 so far."
    end
end
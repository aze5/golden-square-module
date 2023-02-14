require "gratitudes"

RSpec.describe Gratitudes do
    it "returns empty string initially" do
        gratitude = Gratitudes.new
        expect(gratitude.format).to eq "Be grateful for: "
    end

    it "returns 'Be grateful for: life' when 'life' is added" do
        gratitude = Gratitudes.new
        gratitude.add("life")
        expect(gratitude.format).to eq "Be grateful for: life"
    end

    it "returns 'Be grateful for: life, health, wealth' when they are added" do 
        gratitude = Gratitudes.new
        gratitude.add("life")
        gratitude.add("health")
        gratitude.add("wealth")
        expect(gratitude.format).to eq "Be grateful for: life, health, wealth"
    end
end
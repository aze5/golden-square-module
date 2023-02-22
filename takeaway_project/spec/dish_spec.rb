require "dish"

describe Dish do
  it "returns dish name" do
    dish = Dish.new("Kebab", "4.99")
    expect(dish.dish).to eq "Kebab"
  end

  it "returns price" do
    dish = Dish.new("Kebab", "4.99")
    expect(dish.price).to eq "4.99"
  end
end
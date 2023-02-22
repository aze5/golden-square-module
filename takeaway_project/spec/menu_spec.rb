require "menu"

describe Menu do
  it "adds to and returns dishes array" do
    dish1 = double :fake_dish, dish: "Kebab", price: "4.99"
    dish2 = double :fake_dish, dish: "Burger", price: "4.99"
    menu = Menu.new
    menu.add(dish1)
    menu.add(dish2)
    expect(menu.dishes).to eq [dish1, dish2]
  end

  it "shows the menu" do
    dish1 = double :fake_dish, dish: "Kebab", price: "4.99"
    dish2 = double :fake_dish, dish: "Burger", price: "4.99"
    menu = Menu.new
    menu.add(dish1)
    menu.add(dish2)
    expect(menu.view_menu).to eq ["1. Kebab: £4.99", "2. Burger: £4.99"]
  end
end
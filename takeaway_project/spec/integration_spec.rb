require "menu"
require "dish"
require "order"

describe "Integration" do
  it "adds a dish to menu" do
    menu = Menu.new
    dish = Dish.new("Kebab", "4.99")
    menu.add(dish)
    expect(menu.view_menu).to eq ["1. Kebab: £4.99"]
  end

  it "places order and sends sms" do
    io = double :kernel
    menu = Menu.new
    dish = Dish.new("Kebab", "4.99")
    dish2 = Dish.new("Burger", "4.99")
    menu.add(dish)
    menu.add(dish2)
    expect(io).to receive(:puts).with("Menu:\n#{menu.view_menu}")
    expect(io).to receive(:puts).with("Please select a dish number to add to your order (eg. 1): ")
    expect(io).to receive(:gets) {"1"}
    expect(io).to receive(:puts).with("Please select a dish number to add to your order (eg. 1): ")
    expect(io).to receive(:puts).with("If you are finished please press enter twice")
    expect(io).to receive(:gets) {"2"}
    expect(io).to receive(:puts).with("Please select a dish number to add to your order (eg. 1): ")
    expect(io).to receive(:puts).with("If you are finished please press enter twice")
    expect(io).to receive(:gets) {""}
    time_now = double :time_now
    expect(time_now).to receive(:now).and_return(DateTime.parse("2023-02-22 10:36:15.051448 +0000").to_time)
    order = Order.new(io, time_now)
    order.place_order(menu, "+447450323896")
    expect(order.view_receipt).to eq ["Kebab: £4.99", "Burger: £4.99", "Total: £9.98"]
  end
end
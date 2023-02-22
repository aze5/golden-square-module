require "order"

describe Order do
  it "sends sms" do
    io = double :kernel
    time = double :time
    order = Order.new(io, time)
    expect(time).to receive(:now).and_return(DateTime.parse("2023-02-22 13:41:13.667394 +0000").to_time)
    expect(order.get_text("+447450323896")).to eq "SMS sent successfully"
  end

  it "fails when SMS doesn't send" do
    io = double :kernel
    time = double :time
    order = Order.new(io, time)
    expect(time).to receive(:now).and_return(DateTime.parse("2023-02-22 13:41:13.667394 +0000").to_time)
    expect { order.get_text("123") }.to raise_error("Error sending SMS: 'Thank you! Your order was placed and will be delivered before: 14:11'")
  end

  it "Places order, sends SMS, and shows receipt" do
    io = double :kernel
    dish1 = double :fake_dish, dish: "Kebab", price: "4.99"
    dish2 = double :fake_dish, dish: "Burger", price: "4.99"
    menu = double :menu, dishes: [dish1, dish2]
    expect(menu).to receive(:view_menu).and_return(["1. Kebab: £4.99", "2. Burger: £4.99"])
    expect(io).to receive(:puts).with("Menu:\n#{menu.view_menu}")
    expect(io).to receive(:puts).with("Please select a dish number to add to your order (eg. 1): ")
    expect(io).to receive(:gets) {"1"}
    expect(io).to receive(:puts).with("Please select a dish number to add to your order (eg. 1): ")
    expect(io).to receive(:gets) {"2"}
    expect(io).to receive(:puts).with("Please select a dish number to add to your order (eg. 1): ")
    expect(io).to receive(:gets) {"5"}
    expect(io).to receive(:puts).with("Invalid dish number. Please try again.")
    expect(io).to receive(:puts).with("Please select a dish number to add to your order (eg. 1): ")
    expect(io).to receive(:gets) {""}
    time = double :time
    expect(time).to receive(:now).and_return(DateTime.parse("2023-02-22 13:41:13.667394 +0000").to_time)
    order = Order.new(io, time)
    expect(menu).to receive(:view_menu).and_return(["1. Kebab: £4.99", "2. Burger: £4.99"])
    order.place_order(menu, "+447450323896")
    expect(order.view_receipt).to eq ["Kebab: £4.99", "Burger: £4.99", "Total: £9.98"]
  end
end




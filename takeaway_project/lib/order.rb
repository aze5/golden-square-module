require "twilio-ruby"
require "date"
require "dotenv/load"

class Order 
  def initialize(kernel, time)
    @io = kernel
    @order_receipt = []
    @order_total = 0
    @time = time
  end

  def place_order(menu, phone_number) # menu is an instance of Menu, phone number is a str
    @io.puts "Menu:\n#{menu.view_menu}"
    loop do
      @io.puts "Please select a dish number to add to your order (eg. 1): "
      dish_number = @io.gets.chomp
      break if dish_number.empty?

      dish_index = dish_number.to_i - 1
      dish = menu.dishes[dish_index]
      if dish
        @order_receipt << "#{dish.dish}: £#{dish.price}"
        @order_total += dish.price.to_f
      else
        @io.puts "Invalid dish number. Please try again."
    
      end
    end
    get_text(phone_number)
  end

  def view_receipt
    @order_receipt << "Total: £#{@order_total}"
  end
  
  def get_text(to_number)
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    from_number = "+12706389238"
    datetime_of_delivery = @time.now + 30*60
    time_of_delivery = datetime_of_delivery.strftime("%H:%M")
    message = "Thank you! Your order was placed and will be delivered before: #{time_of_delivery}"
    begin
      client = Twilio::REST::Client.new(account_sid, auth_token)
      client.messages.create(
        from: from_number,
        to: to_number,
        body: message
      )
      return "SMS sent successfully"
    rescue Twilio::REST::RestError => e
      fail "Error sending SMS: '#{message}'"
    end
  end
end
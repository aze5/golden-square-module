class Order 
  def initialize
    # ...
  end

  def place_order(menu) # menu is an instance of Menu
    # gets input from customer for the dishes they want 
    # returns nothing
  end

  def view_receipt
    # returns array with all dishes ordered and their prices, and a total
  end
  
  def get_text
    # sends an sms to customer using twilio gem
    # returns nothing
  end
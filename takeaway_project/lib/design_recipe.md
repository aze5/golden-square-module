# Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a customer, so that I can check if I want to order something, I would like to see a list of dishes with prices.

As a customer, so that I can order the meal I want, I would like to be able to select some number of several available dishes.

As a customer, so that I can verify that my order is correct, I would like to see an itemised receipt with a grand total.

_Use the twilio-ruby gem to implement this next one._

As a customer, so that I am reassured that my order will be delivered on time, I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered."

## 2. Design the Class System

```

 ┌─────────────────────────────┐
 │ Menu                        │   
 │  - add(dish)                │ ◄───────┐                
 │  - view_menu                │         │ includes the use of a menu
 │    => ["kebab: £4.99", ...] │         │ object.
 │                             │  ┌──────────────────────────┐
 │                             │  │ Order                    │
 └────┬────────────────────────┘  │  - place_order           │
      │                           │  - view_receipt          │
      │ owns a list of            │    => [dish: £4.99...    │
      ▼                           │        total: £27.88}    │
 ┌─────────────────────────────┐  │  - get_text              │
 │ Dish                        │  │                          │
 │  - dish                     │  └──────────────────────────┘
 │    => "dish_name"           │
 │  - price                    │
 │    => "4.99"                │
 │                             │
 └─────────────────────────────┘

```

```ruby
class Order 
  def initialize
    # ...
  end

  def place_order(menu, phone_number) 
    # menu is an instance of Menu phone_number is a string
    # gets input from customer for the dishes they want 
    # returns nothing
  end

  def view_receipt
    # returns array with all dishes ordered and their prices, and a total
  end
  
  def get_text(to_number) # to_number is a string
    # sends an sms to customer using twilio gem
    # returns success/fail method
  end

class Menu
  def initialize
    # ...
  end

  def add(dish) # dish is an instance of Dish
    # dish gets added to the menu
    # Returns nothing
  end

  def view_menu
    # Returns a list of dishes and there prices like this:
    #  => ["kebab: £4.99", ...]
  end
end

class Dish
  def initialize(dish_name, price) 
    # dish_name is a string, price is an integer
    # ...
  end

  def dish
    # Returns a dish name
  end

  def price
    # returns price as a string
  end
end
```

## 3. Create Examples as Integration Tests

```ruby
# Menu adds a dish
menu = Menu.new
dish = Dish.new("kebab", "4.99")
menu.add(dish)
menu.view_menu # --> ["kebab: £4.99"]

# places order
menu = Menu.new
dish = Dish.new("Kebab", "4.99")
dish2 = Dish.new("Burger", "4.99")
menu.add(dish)
menu.add(dish2)
order = Order.new
order.place_order(menu)
order.view_receipt # => ["Kebab: £4.99", "Burger: £4.99", "Total: £9.98"]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# Order UNIT TESTS

# Sends an SMS
io = double :kernel
time = double :time
order = Order.new(io, time)
order.get_text("+447450323896") # => "SMS sent successfully"

# fails when SMS doesn't send
io = double :kernel
time = double :time
order = Order.new(io, time)
order.get_text("123") # fails with => "Error sending SMS: 'Thank you! Your order was placed and will be delivered before: 18:30'"

# Places order, sends SMS, and shows receipt
io = double :kernel
dish1 = double :fake_dish, dish: "Kebab", price: "4.99"
dish2 = double :fake_dish, dish: "Burger", price: "4.99"
menu = double :menu, dishes: [dish1, dish2]
time = double :time
order = Order.new(io, time)  
order.place_order(menu, "+447450323896")
order.view_receipt # => ["Kebab: £4.99", "Burger: £4.99", "Total: £9.98"]

# Menu UNIT TESTS

# Adds to and returns the dishes array
dish1 = double :fake_dish, dish: "Kebab", price: "4.99"
dish2 = double :fake_dish, dish: "Burger", price: "4.99"
menu = Menu.new
menu.add(dish1)
menu.add(dish2)
menu.dishes # => [dish1, dish2]

# Shows the menu
dish1 = double :fake_dish, dish: "Kebab", price: "4.99"
dish2 = double :fake_dish, dish: "Burger", price: "4.99"
menu = Menu.new
menu.add(dish1)
menu.add(dish2)    
menu.view_menu # => ["1. Kebab: £4.99", "2. Burger: £4.99"]

# Dish UNIT TESTS

# Returns dish name
dish = Dish.new("Kebab", "4.99")
dish.dish # => "Kebab"

# Returns dish price
dish = Dish.new("Kebab", "4.99")
dish.price # => "4.99"
```
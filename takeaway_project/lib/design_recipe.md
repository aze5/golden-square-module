# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a customer, so that I can check if I want to order something, I would like to see a list of dishes with prices.

As a customer, so that I can order the meal I want, I would like to be able to select some number of several available dishes.

As a customer, so that I can verify that my order is correct, I would like to see an itemised receipt with a grand total.

_Use the twilio-ruby gem to implement this next one._

As a customer, so that I am reassured that my order will be delivered on time, I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## 2. Design the Class System

```

 ┌─────────────────────────────┐
 │ Menu                        │   
 │  - add(dish)                │ ◄───────┐                
 │  - view_menu                │         │ includes the use of a menu object
 │    => ["kebab: £4.99", ...] │         │  
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
  def initialize(dish_name, price) # dish_name is a string, price is an integer
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

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# Menu adds a dish
menu = Menu.new
dish = Dish.new("kebab", "4.99")
menu.add(dish)
menu.view_menu # --> ["kebab: £4.99"]

# Order shows menu when order is being placed

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
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
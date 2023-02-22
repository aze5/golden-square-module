class Menu
  def initialize
    @dishes = []
  end

  def dishes 
    @dishes
  end

  def add(dish) # dish is an instance of Dish
    @dishes << dish
  end

  def view_menu
    menu = []
    @dishes.each_with_index do |dish, index|
      menu << "#{index + 1}. #{dish.dish}: £#{dish.price}"
    end
    menu
  end
end


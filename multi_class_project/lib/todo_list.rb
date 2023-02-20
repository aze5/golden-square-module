class TodoList
  def initialize
    @tasks = []
  end

  def add(todo) # todo is a string
    @tasks << todo
  end

  def tasks
    @tasks
  end
end
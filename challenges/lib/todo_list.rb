class TodoList
  def initialize
    @tasks = []
  end

  def add(todo) # todo is an instance of Todo
    @tasks << todo
  end

  def tasks 
    @tasks
  end

  def incomplete
    incomplete = []
    @tasks.each do |task|
      if !task.done? 
        incomplete << task
      end
    end
    return incomplete
  end

  def complete
    complete = []
    @tasks.each do |task|
      if task.done? 
        complete << task
      end
    end
    return complete
  end

  def give_up!
    @tasks.each do |task|
      task.mark_done!
    end
  end
end

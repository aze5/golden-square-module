class TaskTracker
    def initialize
      @tasks = []
    end
  
    def view
      return @tasks
    end
  
    def add(task) 
      @tasks << task
    end
  
    def complete_task(task)
      fail "No such task." unless @tasks.include?(task)
      @tasks.delete(task)
    end
  end
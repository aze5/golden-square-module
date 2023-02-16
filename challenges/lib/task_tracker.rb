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
      # marks a task as complete and removes the task from the list
      # fails if there are no tasks
      # No return value
    end
  end
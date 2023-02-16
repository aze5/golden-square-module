# TaskTracker Class Design Recipe

## 1. Describe the Problem

As a user, so that I can keep track of my tasks, I want a program that I can add todo tasks to and see a list of them.

As a user, so that I can focus on tasks to complete, I want to mark tasks as complete and have them disappear from the list.

## 2. Class Interface Design


```ruby
class TaskTracker
  def initialize
    # ...
  end

  def view
    # returns array of tasks
  end

  def add(task) # task is a string
    # adds a task to array
    # no return value
  end

  def complete_task(task)
    # marks a task as complete and removes the task from the list
    # fails if there are no tasks
    # No return value
  end
end
```

## 3. Examples as Tests


```ruby
# 1
tasks = TaskTracker.new
tasks.add("Walk the dog")
tasks.view => ["Walk the dog"]

# 2
tasks = TaskTracker.new
tasks.complete_task(task) # fails with "No task set."

# 3
tasks = TaskTracker.new
tasks.add("Walk the dog")
tasks.view => ["Walk the dog"]
tasks.complete_task("Walk the dog")
tasks.add("Wash dishes")
tasks.add("Finish chapter 7")
tasks.view => ["Wash dishes", "Finish chapter 7"]
```
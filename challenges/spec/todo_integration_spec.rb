require "todo"
require "todo_list"

describe "integration" do
  it "adds a task" do
    list = TodoList.new
    task = Todo.new("Walk dog")
    result = list.add(task)
    expect(list.tasks).to eq [task]
  end

  it "returns incomplete tasks" do
    list = TodoList.new
    task = Todo.new("Walk dog")
    list.add(task)
    expect(list.incomplete).to eq [task]
  end

  it "returns complete tasks" do
    list = TodoList.new
    task = Todo.new("Walk dog")
    task.mark_done!
    list.add(task)
    expect(list.complete).to eq [task]
  end

  it "marks all as done if give up is called" do
    list = TodoList.new
    task = Todo.new("Walk dog")
    task2 = Todo.new("Feed cat")
    task3 = Todo.new("Take bath")
    list.add(task)
    list.add(task2)
    list.add(task3)
    list.give_up!
    expect(list.complete).to eq [task, task2, task3]
  end
end
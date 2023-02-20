require "todo_list"

describe TodoList do
  it "adds a task" do
    todo = TodoList.new
    todo.add("task1")
    todo.add("task2")
    expect(todo.tasks).to eq ["task1", "task2"]
  end
end
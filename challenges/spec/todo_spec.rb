require "todo"

describe Todo do
  it "initializes" do
    task = Todo.new("Walk dog")
    expect(task).to eq task
  end

  it "returns task" do
    task = Todo.new("Walk dog")
    expect(task.task).to eq "Walk dog"
  end

  it "marks done" do
    todo = Todo.new("Walk dog")
    todo.mark_done!
    expect(todo.done?).to eq true
  end

  it "checks done" do
    todo = Todo.new("Walk dog")
    expect(todo.done?).to eq false
  end
end
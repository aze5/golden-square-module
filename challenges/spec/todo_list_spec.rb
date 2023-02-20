require "todo_list"

describe TodoList do
  it "initializes" do
    list = TodoList.new
    expect(list).to eq list
  end
end
require "task_tracker"

describe TaskTracker do
    it "returns a task that has been added" do
        tasks = TaskTracker.new
        tasks.add("Walk the dog")
        expect(tasks.view).to eq ["Walk the dog"]
    end
end
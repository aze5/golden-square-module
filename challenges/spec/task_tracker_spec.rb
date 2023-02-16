require "task_tracker"

describe TaskTracker do
    it "returns a task that has been added" do
        tasks = TaskTracker.new
        tasks.add("Walk the dog")
        expect(tasks.view).to eq ["Walk the dog"]
    end

    it "returns two tasks that have been added" do
        tasks = TaskTracker.new
        tasks.add("Walk the dog")
        tasks.add("Wash dishes")
        expect(tasks.view).to eq ["Walk the dog", "Wash dishes"]
    end
end
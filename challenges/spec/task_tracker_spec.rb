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

    it "returns 1 task after 1 task is completed" do
        tasks = TaskTracker.new
        tasks.add("Walk the dog")
        tasks.add("Wash dishes")
        tasks.complete_task("Walk the dog")
        expect(tasks.view).to eq ["Wash dishes"]
    end

    it "fails if an attempt is made to complete a task that doesn't exist" do
        tasks = TaskTracker.new
        expect { tasks.complete_task("Walk the dog") }.to raise_error("No such task.")
    end

    it "returns 2 tasks after 2 tasks are added, one is completed and one is added again" do
        tasks = TaskTracker.new
        tasks.add("Walk the dog")
        tasks.add("Wash dishes")
        tasks.complete_task("Walk the dog")
        tasks.add("Finish chapter 7")
        expect(tasks.view).to eq ["Wash dishes", "Finish chapter 7"]
    end
end
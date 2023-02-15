require "report_length"

RSpec.describe "report_length method" do
    it "returns 'This string was 5 characters long.' when passed 'phone'" do
        expect(report_length("phone")).to eq "This string was 5 characters long."
    end

    it "returns the correct number of letters when passed a random string" do
        string_list = ["tennis", "mouse", "generate", "credible", "thinking", "window"]
        string = string_list.sample
        expect(report_length(string)).to eq "This string was #{string.length} characters long."
    end
end
require "diary"
require "diary_entry"

describe "integration" do
  it "returns word count" do
    diary = Diary.new
    diary_entry = DiaryEntry.new("07/11/19", "contents")
    diary.add(diary_entry)
    expect(diary.all).to eq [diary_entry]
  end
end
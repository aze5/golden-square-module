require "diary"
require "diary_entry"

describe "integration" do
  it "returns returns diary entries" do
    diary = Diary.new
    diary_entry = DiaryEntry.new("07/11/19", "contents")
    diary.add(diary_entry)
    expect(diary.all).to eq [diary_entry]
  end

  it "returns word count in diary" do
    diary = Diary.new
    diary_entry = DiaryEntry.new("07/11/19", "contents " * 5)
    diary_entry2 = DiaryEntry.new("entry", "contents " * 10)
    diary.add(diary_entry)
    diary.add(diary_entry2)
    expect(diary.count_words).to eq 15
  end
end
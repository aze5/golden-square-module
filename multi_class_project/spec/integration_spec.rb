require "diary"
require "diary_entry"

describe "integration" do
  it "adds new entry" do
    diary = Diary.new
    entry = DiaryEntry.new("title", "contents")
    entry2 = DiaryEntry.new("title", "contents")
    diary.add(entry)
    diary.add(entry2)
    expect(diary.all).to eq [entry, entry2]
  end

  it "returns best entry for reading time" do
    diary = Diary.new
    entry = DiaryEntry.new("title", "contents " * 49 + "contents")
    entry2 = DiaryEntry.new("title2", "contents " * 99 + "contents")
    diary.add(entry)
    diary.add(entry2)
    expect(diary.best_entry_for_reading_time(50, 1)).to eq entry
  end

  it "returns phone numbers in entries" do
    diary = Diary.new
    entry = DiaryEntry.new("title", "hello my name is ayoub, number is 07558-343796")
    entry2 = DiaryEntry.new("title", "hello my name is jamie, number is 07858-343796")
    diary.add(entry)
    diary.add(entry2)
    expect(diary.all_numbers).to eq ["07558-343796", "07858-343796"]
  end
end
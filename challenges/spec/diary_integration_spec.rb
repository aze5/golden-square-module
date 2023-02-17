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

  it "returns reading time for all entries" do
    diary = Diary.new
    diary_entry = DiaryEntry.new("07/11/19", "contents")
    diary_entry2 = DiaryEntry.new("11/02/20", "contents " * 50)
    diary_entry3 = DiaryEntry.new("17/06/20", "contents " * 100)
    diary.add(diary_entry)
    diary.add(diary_entry2)
    diary.add(diary_entry3)
    expect(diary.reading_time(50)).to eq 3
  end

  it "returns the best entry for specified reading time" do
    diary = Diary.new
    diary_entry = DiaryEntry.new("07/11/19", "contents")
    diary_entry2 = DiaryEntry.new("11/02/20", "contents " * 50)
    diary_entry3 = DiaryEntry.new("17/06/20", "contents " * 100)
    diary.add(diary_entry)
    diary.add(diary_entry2)
    diary.add(diary_entry3)
    expect(diary.find_best_entry_for_reading_time(50, 1)).to eq diary_entry2
  end

end
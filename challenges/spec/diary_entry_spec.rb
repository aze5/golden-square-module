require "diary_entry"

describe DiaryEntry do
  it "counts words" do
    diary_entry = DiaryEntry.new("entry1", "contents " * 10)
    expect(diary_entry.count_words).to eq 10
  end
end
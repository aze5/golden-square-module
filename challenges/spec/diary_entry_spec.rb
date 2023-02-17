require "diary_entry"

describe DiaryEntry do
  it "returns title" do
    diary_entry = DiaryEntry.new("entry1", "contents " * 10)
    expect(diary_entry.title).to eq "entry1"
  end
  
  it "returns contents" do
    diary_entry = DiaryEntry.new("entry1", "contents")
    expect(diary_entry.contents).to eq "contents"
  end

  it "counts words" do
    diary_entry = DiaryEntry.new("entry1", "contents " * 10)
    expect(diary_entry.count_words).to eq 10
  end
  
  it "returns reading time" do
    diary_entry = DiaryEntry.new("entry1", "contents " * 100)
    expect(diary_entry.reading_time(50)).to eq 2
  end
end
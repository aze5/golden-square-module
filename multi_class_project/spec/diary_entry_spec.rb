require "diary_entry"

describe DiaryEntry do
  it "returns title" do
    entry = DiaryEntry.new("Title", "Contents")
    expect(entry.title).to eq "Title"
  end
    
  it "returns contents" do
    entry = DiaryEntry.new("Title", "Contents")
    expect(entry.contents).to eq "Contents"
  end

  it "returns word count" do
    entry = DiaryEntry.new("Title", "Contents " * 9 + "Contents")
    expect(entry.count_words).to eq 10
  end
end
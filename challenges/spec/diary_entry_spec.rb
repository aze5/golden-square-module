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

  context "reading_chunk method" do
    it "returns first chunk of 100 words for wpm = 10 and minutes = 10" do
      entry = DiaryEntry.new("title", "contents " * 100 + "world " * 100)
      expect(entry.reading_chunk(10, 10)).to eq "contents " * 99 + "contents"
    end
    it "returns next chunk of 100 words when called again" do
      entry = DiaryEntry.new("title", "contents " * 100 + "world " * 100)
      entry.reading_chunk(10, 10)
      expect(entry.reading_chunk(10, 10)).to eq "world " * 99 + "world"
    end
    it "returns content until the end" do
      entry = DiaryEntry.new("title", "contents " * 50 + "world " * 50)
      entry.reading_chunk(10, 3)
      entry.reading_chunk(10, 3)
      expect(entry.reading_chunk(10, 10)).to eq "world " * 39 + "world"
    end
    it "restart at the beginning" do
      entry = DiaryEntry.new("title", "contents " * 100 + "world " * 100)
      entry.reading_chunk(10, 10)
      entry.reading_chunk(10, 10)
      expect(entry.reading_chunk(10, 10)).to eq "contents " * 99 + "contents"
    end
  end
end
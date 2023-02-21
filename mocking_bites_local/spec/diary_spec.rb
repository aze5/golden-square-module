require "diary"

describe Diary do
  it "constructs" do
    diary = Diary.new("contents")
    expect(diary).to be
  end

  it "returns contents" do
    diary = Diary.new("contents")
    expect(diary.read).to eq "contents"
  end
end
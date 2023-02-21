require "secret_diary"
require "diary"

describe "integration" do
  it "unlocks diary" do
    diary = Diary.new("contents")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "contents"
  end

  it "initially has diary locked" do
    diary = Diary.new("contents")
    secret_diary = SecretDiary.new(diary)
    expect { secret_diary.read }.to raise_error("Go away!")
  end

  it "locks diary after being unlocked" do
    diary = Diary.new("contents")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    secret_diary.lock
    expect { secret_diary.read }.to raise_error("Go away!")
  end
end
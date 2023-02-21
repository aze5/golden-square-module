require "secret_diary"

describe SecretDiary do
  it "unlocks diary" do
    diary = double :diary, contents: "contents", read: "contents"
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "contents"
  end

  it "inititally has diary locked" do
    diary = double :diary, contents: "contents", read: "contents"
    secret_diary = SecretDiary.new(diary)
    expect { secret_diary.read }.to raise_error("Go away!")
  end

  it "locks diary after being unlocked" do
    diary = double :diary, contents: "contents", read: "contents"
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    secret_diary.lock
    expect { secret_diary.read }.to raise_error("Go away!")
  end
end
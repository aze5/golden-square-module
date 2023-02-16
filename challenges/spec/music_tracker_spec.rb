require "music_tracker"

describe MusicTracker do
  it "returns a song after being added" do
    songs = MusicTracker.new
    songs.add("song name")
    expect(songs.view).to eq ["song name"]
  end
end
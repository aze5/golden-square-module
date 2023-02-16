require "music_tracker"

describe MusicTracker do
  it "returns a song after being added" do
    songs = MusicTracker.new
    songs.add("song name")
    expect(songs.view).to eq ["song name"]
  end

  it "returns a song after being added" do
    songs = MusicTracker.new
    songs.add("song name")
    songs.add("song name2")
    expect(songs.view).to eq ["song name", "song name2"]
  end

  it "remove a song from array if .remove(song) is called" do
    songs = MusicTracker.new
    songs.add("song name")
    songs.remove("song name")
    expect(songs.view).to eq []
  end
end
require "music_library"
require "track"

describe "Integration" do
  it "adds a track" do
    lib = MusicLibrary.new
    track = Track.new("title", "artist")
    lib.add(track)
    expect(lib.all).to eq [track]
  end

  it "finds a keyword" do
    lib = MusicLibrary.new
    track1 = Track.new("title", "artist")
    track2 = Track.new("not include", "artist")
    lib.add(track1)
    lib.add(track2)
    expect(lib.search("title")).to eq [track1]
  end
end
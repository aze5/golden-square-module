require "music_library" 

describe MusicLibrary do
  it "adds a track to library" do
    lib = MusicLibrary.new
    track = double :fake_track
    lib.add(track)
    expect(lib.all).to eq [track]
  end

  it "finds a track by keyword" do
    lib = MusicLibrary.new
    track1 = double :track
    expect(track1).to receive(:matches?).with("title").and_return(true)
    track2 = double :track
    expect(track2).to receive(:matches?).with("title").and_return(false)
    lib.add(track1)
    lib.add(track2)
    expect(lib.search("title")).to eq [track1]
  end
end
require "track"

describe Track do
  it "matches keyword" do
    track = Track.new("title", "artist")
    expect(track.matches?("title")).to eq true
  end 

  it "doesnt match keyword" do
    track = Track.new("title", "artist")
    expect(track.matches?("false")).to eq false
  end 
end
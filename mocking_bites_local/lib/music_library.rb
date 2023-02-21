class MusicLibrary
  def initialize
    @tracks = []
  end

  def add(track) # track is an instance of Track
    @tracks << track
  end

  def all
    @tracks 
  end
  
  def search(keyword) # keyword is a string
    matches = []
    @tracks.each do |track|
      if track.matches?(keyword)
        matches << track
      end 
    end
    matches
  end
end
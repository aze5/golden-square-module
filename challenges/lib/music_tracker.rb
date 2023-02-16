class MusicTracker
    def initialize
      @songs = []
    end
  
    def add(song) 
      @songs << song
    end
  
    def remove(song) # song is a string
      fail "No such song." unless @songs.include?(song)
      @songs.delete(song)
    end
  
    def view
      return @songs
    end
  end
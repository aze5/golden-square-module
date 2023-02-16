class MusicTracker
    def initialize
      @songs = []
    end
  
    def add(song) 
      @songs << song
    end
  
    def remove(song) # song is a string
      # fails if songs array is empty
      # remove song from songs array
      # No return value
    end
  
    def view
      return @songs
    end
  end
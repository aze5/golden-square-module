class Track
  def initialize(title, artist) # title and artist are both strings
    @title = title
    @artist = artist
  end
  
  def title
    @title
  end

  def artist
    @artist
  end

  def matches?(keyword) # keyword is a string
    @title == (keyword) || @artist == (keyword)
  end
end
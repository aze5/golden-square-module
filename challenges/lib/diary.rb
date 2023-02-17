class Diary
  def initialize
  @entries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    @entries << entry
  end

  def all
    return @entries
  end

  def count_words
    count = 0
    @entries.each do |entry|
      count += entry.count_words
    end
    return count
  end

  def reading_time(wpm) 
    minute_count = 0
    @entries.each do |entry|
      minute_count += entry.reading_time(wpm)
    end
    return minute_count
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
  end
end
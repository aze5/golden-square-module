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
    max_words = wpm * minutes
    valid_entries = @entries.select { |entry| entry.count_words <= max_words}
    sorted_entries = valid_entries.sort_by { |entry| -entry.count_words }
    return sorted_entries.find { |entry| entry.count_words <= max_words}
  end
end
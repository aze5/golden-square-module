require_relative "diary_entry"

class Diary
  def initialize
    @entries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    @entries << entry
  end

  def all
    @entries
  end
  
  def best_entry_for_reading_time(wpm, minutes) # both params are integers
    max_words = wpm * minutes
    valid_entries = @entries.select { |entry| entry.count_words <= max_words}
    sorted_entries = valid_entries.sort_by { |entry| -entry.count_words }
    sorted_entries.find { |entry| entry.count_words <= max_words}
  end

  def all_numbers
    phone_regex = /(\d{5}[-.\s]?\d{6})/
    @numbers = []
    @entries.each do |entry|
      matches = entry.contents.scan(phone_regex)
      @numbers << matches
    end
    @numbers.flatten
  end
end



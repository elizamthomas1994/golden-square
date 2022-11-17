class Diary
  def initialize
    @diary = []
  end 

  def add(entry)
    # entry is an instance of DiaryEntry
    # Returns nothing
    @diary << entry
  end 

  def all
    # Returns a list of instances of DiaryEntry
    @diary
  end 

  def reading_time(wpm) # wpm is an integer representing
    # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
    fail "WPM must be positive." if wpm == 0

    count = 0

    @diary.each do |entry|
      count += entry.count_words
    end

    return (count / wpm.to_f).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    # `wpm` is an integer representing the number of words the user can read
    # per minute.
    # `minutes` is an integer representing the number of minutes the user
    # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
    max_words = (wpm * minutes)
    best_entry = nil
    best_words = 0
    @diary.each do |entry|
      if (entry.count_words <= max_words) && (best_words < entry.count_words)
        best_entry = entry
        best_words = entry.count_words
      end
    end
    best_entry
  end
end
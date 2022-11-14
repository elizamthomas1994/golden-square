class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @word_starting_point = 0
  end
  
  def title
    return @title
  end
  
  def contents
    return @contents
  end
  
  def count_words
    return @contents.split(" ").length
  end
  
  def reading_time(wpm) # wpm is an integer representing the number of words the
    # user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    fail "reading speed must be above 0" if wpm == 0
    (count_words / wpm.to_f).ceil
  end
  
  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
    # of words the user can read per minute
    # `minutes` is an integer representing the
    # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
    readable_text_amount = wpm * minutes
    start_at = @word_starting_point
    end_at = @word_starting_point + readable_text_amount 
    readable_text = @contents.split(" ")[start_at, end_at]
    if end_at > count_words
      @word_starting_point = 0
    else 
      @word_starting_point = end_at
    end
    combine_text = readable_text.join(" ")
    return "#{combine_text} "
  end
end
class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
  end 

  def title
    # Returns the title as a string
    @title
  end

  def contents
    # Returns the contents as a string
    @contents
  end

  def count_words
    # Returns the number of words in the contents as an integer
    words = @contents.split(" ")
    words.length
  end 
end
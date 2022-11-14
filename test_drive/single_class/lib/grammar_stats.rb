class GrammarStats
  def initialize
    # ...
    @texts_checked = []
    @texts_passed = []
  end
  
  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    fail "not a string" if text.empty?

    first_letter_checker = text[0] == text[0].upcase
    last_letter_checker = [".", "?", "!"].include? text[-1]

    if first_letter_checker && last_letter_checker
      @texts_checked << text
      @texts_passed << text
      return true
    else
      @texts_checked << text
      return false
    end
  end
  
  def percentage_good
    no_texts_checked = @texts_checked.length
    no_texts_passed = @texts_passed.length

    percentage_rate = (no_texts_passed.to_f / no_texts_checked.to_f) * 100
    "#{percentage_rate.ceil}%"
  end
end
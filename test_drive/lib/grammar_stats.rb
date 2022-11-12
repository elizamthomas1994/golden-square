class GrammarStats
    def initialize
      # ...
    end
  
    def check(text) # text is a string
      # Returns true or false depending on whether the text begins with a capital
      # letter and ends with a sentence-ending punctuation mark.
      fail "not a string" if text.empty?
      first_letter_checker = text[0] == text[0].upcase
      last_letter_checker = [".", "?", "!"].include? text[-1]
      if first_letter_checker && last_letter_checker
        return true
      else
        return false
      end
    end
  
    def percentage_good
      # Returns as an integer the percentage of texts checked so far that passed
      # the check defined in the `check` method. The number 55 represents 55%.
    end
  end
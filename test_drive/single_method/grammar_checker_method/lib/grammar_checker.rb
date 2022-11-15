def grammar_checker(text)
  fail "Not a sentence." if text.empty?
  first_letter_checker = text[0] == text[0].upcase
  last_letter_checker = [".", "?", "!"].include? text[-1]
  if first_letter_checker && last_letter_checker
    return true
  else
    return false
  end
end
def reading_time_calculator(text)
  # We take the text argument and convert it into an array of words in the words variable:
  words = text.split(" ")
  #We use words.length to get the number of words in our array, then divide it by 200
  return (words.length / 200.to_f).ceil
  #We use "to_f" to divide integers that aren't fully divisible by 200 into decimal numbers
  #Finally, we use the ceil method to round up any decimal numbers to the nearest whole number.
end
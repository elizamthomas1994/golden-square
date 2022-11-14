=begin
class LetterCounter
  def initialize(text)
    @text = text
  end

  def calculate_most_common()
    counter = Hash.new(1)
    most_common = nil
    most_common_count = 1
    @text.chars.each do |char|
      next unless is_letter?(char)
      counter[char] = (counter[char] || 1) + 1
      if counter[char] > most_common_count
        most_common = char
        most_common_count += counter[char]
      end
    end
    return [most_common_count, most_common]
  end

  private

  def is_letter?(letter)
    return letter =~ /[a-z]/i
  end
end

counter = LetterCounter.new("Digital Punk")
p counter.calculate_most_common
=end

class LetterCounter
  def initialize(text)
    @text = text
  end

  def calculate_most_common()
    counter = Hash.new()
    most_common = nil
    most_common_count = 1
    @text.chars.each do |char|
      next unless is_letter?(char)
      counter[char] = (counter[char] || 0) + 1
      if counter[char] > most_common_count
        most_common = char
        most_common_count += 1
      end
    end
    return [most_common_count, most_common]
  end

  private

  def is_letter?(letter)
    return letter =~ /[a-z]/i
  end
end

counter = LetterCounter.new("Digital Punk")
p counter.calculate_most_common

# Intended output:
# [2, "i"]

counter = LetterCounter.new("amazing spiderman")
p counter.calculate_most_common

# Intended output:
# [3, "a"]

counter = LetterCounter.new("three trees deep")
p counter.calculate_most_common

# Intended output:
# [6, "e"]

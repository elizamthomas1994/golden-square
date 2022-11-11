=begin
def get_most_common_letter(text)
  counter = Hash.new(0)
  text.chars.each do |char|
    counter[char] += 1
  end
  counter.to_a.sort_by { |k, v| v }[0][0]
end

# Intended output:
get_most_common_letter("the roof, the roof, the roof is on fire!")
=> "o"
=end

def get_most_common_letter(text)
  counter = Hash.new(0)
  text.chars.each do |char|
    # Code was reading spaces as characters, so first we must exclude white space using the below line:
    if char != " "
      counter[char] += 1
    end
  end
  # Rather than use "sort_by", we can use "max_by" to get the higest value, then return the relevant key using the below:
  counter.to_a.max_by { |k, v| v }[0][0]
end
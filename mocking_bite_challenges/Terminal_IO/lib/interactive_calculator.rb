class InteractiveCalculator
  def initialize(terminal)
    @terminal = terminal
  end

  def run
    @terminal.puts "Hello. I will subtract two numbers."
    @terminal.puts "Please enter a number"
    number_1 = @terminal.gets.to_i
    @terminal.puts "Please enter another number"
    number_2 = @terminal.gets.to_i
    @terminal.puts "Here is your result:"
    @terminal.puts "#{number_1} - #{number_2} = #{number_1 - number_2}"
  end
end

# Example Call
# ============
# interactive_calculator = InteractiveCalculator.new(Kernel)
# interactive_calculator.run

# Output
# ======
# Hello. I will subtract two numbers.
# Please enter a number
# 4
# Please enter another number
# 3
# Here is your result:
# 4 - 3 = 1
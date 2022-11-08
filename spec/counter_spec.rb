require 'counter'

RSpec.describe Counter do
  it "starts at 0 and counts to a given number" do
    counter = Counter.new
    counter.add(7)
    result = counter.report
    expect(result).to eq "Counted to 7 so far."
  end

  it "returns 0" do
      counter = Counter.new
      result = counter.report
      expect(result).to eq "Counted to 0 so far."
  end
end




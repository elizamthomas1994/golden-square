require 'report_length'

RSpec.describe "report_length method" do
  it "takes a string and outputs the length of the string" do
    result = report_length("I like pizza!")
    expect(result).to eq "This string was 13 characters long."
  end
end
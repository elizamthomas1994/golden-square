require 'greet'

RSpec.describe "greet method" do
  it "outputs a string featuring a given name" do
    result = greet('Eliza')
    expect(result).to eq "Hello, Eliza!"
  end
end
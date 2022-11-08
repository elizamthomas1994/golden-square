require 'gratitudes'

RSpec.describe Gratitudes do
  it "initializes an empty array" do
    gratitudes = Gratitudes.new
    expect(gratitudes.format).to eq "Be grateful for: "
  end

  it "takes a string and pushes it to array" do
    gratitudes = Gratitudes.new
    gratitudes.add("friends")
    gratitudes.add("health")
    gratitudes.add("food")
    expect(gratitudes.format).to eq "Be grateful for: friends, health, food"
  end
end
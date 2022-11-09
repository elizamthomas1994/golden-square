require 'grammar_checker'

RSpec.describe 'grammar_checker method' do
  context "given an empty string" do
    it "fails" do
      expect{ grammar_checker("") }.to raise_error "Not a sentence."
    end
  end

  context "given a string without capital or punctuation" do
    it "returns false" do
      expect(grammar_checker("hello, world")).to eq false  
    end
  end

  context "given a string with capital and full stop" do
    it "returns true" do
      expect(grammar_checker("Hello, world.")).to eq true
    end
  end

  context "given a string with capital and exclamation mark" do
    it "returns true" do
      expect(grammar_checker("Hello, world!")).to eq true
    end
  end

  context "given a string with capital and question mark" do
    it "returns true" do
      expect(grammar_checker("Hello, world?")).to eq true
    end
  end

  context "given a string with no capital and punctuation" do
    it "returns false" do
      expect(grammar_checker("hello, world.")).to eq false
    end
  end

  context "given a string with capital and no punctuation" do
    it "returns false" do
      expect(grammar_checker("Hello, world")).to eq false 
    end
  end

end
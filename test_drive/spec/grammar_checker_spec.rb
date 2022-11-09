require 'grammar_checker'

RSpec.describe 'grammar_checker method' do
  context "given an empty string" do
    it "fails" do
      expect{ grammar_checker("") }.to raise_error "Not a sentence."
    end
  end
end
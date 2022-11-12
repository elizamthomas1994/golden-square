require 'grammar_stats'

RSpec.describe GrammarStats do
  it 'constructs' do
    grammar_stats = GrammarStats.new
  end

  describe '#check' do
    context 'given a string with capital and ending with full stop' do
      it 'returns true' do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("Hello world.")).to eq true
      end
    end

    context 'given a string with capital and ending with exclamation mark' do
      it 'returns true' do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("How are you?")).to eq true
      end
    end

    context 'given a string with capital and ending with question mark' do
      it 'returns true' do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("How are you?")).to eq true
      end
    end

    context 'given a string with no capital nor punctuation' do
      it 'returns false' do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("hello world")).to eq false
      end
    end

    context 'given a string with no capital and relevant punctuation' do
      it 'returns false' do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("hello world.")).to eq false
      end
    end

    context 'given a string with capital and no punctuation' do
      it 'returns false' do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("Hello world")).to eq false
      end
    end

    context 'given an empty string' do
      it 'fails' do
        grammar_stats = GrammarStats.new
        expect{ grammar_stats.check("") }.to raise_error "not a string"
      end
    end
  end
end
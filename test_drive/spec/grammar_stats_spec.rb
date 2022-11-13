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

  describe '#percentage_good' do
    context 'given an even number of text checks pass and fail' do
      it 'returns 50 percent' do
        grammar_stats = GrammarStats.new
        grammar_stats.check("hello world")
        grammar_stats.check("Hello world.")
        expect(grammar_stats.percentage_good).to eq "50%"
      end
    end

    context 'given every text check passes' do
      it 'returns 100 percent' do
        grammar_stats = GrammarStats.new
        grammar_stats.check("Hello world!")
        grammar_stats.check("Hello world.")
        grammar_stats.check("How are you?")
        expect(grammar_stats.percentage_good).to eq "100%"
      end
    end

    context 'given every text check fails' do
      it 'returns 0 percent' do
        grammar_stats = GrammarStats.new
        grammar_stats.check("hello world")
        grammar_stats.check("how are you")
        grammar_stats.check("my name is eliza")
        expect(grammar_stats.percentage_good).to eq "0%"
      end
    end
  end
end
require 'reading_time_calculator'

RSpec.describe 'reading_time_calculator method' do
  context 'given an empty string' do
    it 'returns zero' do
      result = reading_time_calculator("")
      expect(result).to eq 0
    end
  end

  context 'given a string of less than 200 words' do
    it 'returns one' do
      result = reading_time_calculator("hello ")
      expect(result).to eq 1
    end
  end

  context 'given a string of 200 words' do
    it 'returns one' do
      result = reading_time_calculator("one " * 200)
      expect(result).to eq 1
    end
  end

  context 'given a string of 400 words' do
    it 'returns two' do
      result = reading_time_calculator("one " * 400)
      expect(result).to eq 2
    end
  end

  context 'given a string of 1000 words' do
    it 'returns five' do
      result = reading_time_calculator("hello " * 1000)
    end
  end

  context 'given a string of 10000 words' do
    it 'returns fifty' do
      result = reading_time_calculator("hello " * 10000)
    end
  end

end
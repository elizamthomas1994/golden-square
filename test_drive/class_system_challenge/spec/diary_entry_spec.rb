require 'diary_entry'

RSpec.describe '#count_words' do
  it 'returns 0 if entry is empty' do
    entry_1 = DiaryEntry.new('title', '')
    expect(entry_1.count_words).to eq(0)
  end

  it 'returns 10 if entry contents contains 10 words' do
    entry_1 = DiaryEntry.new('title', 'hello ' * 10)
    expect(entry_1.count_words).to eq(10)
  end
end
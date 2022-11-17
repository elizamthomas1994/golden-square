require 'diary'

RSpec.describe 'when diary is empty' do
  describe '#all' do
    it 'returns an empty list' do
      diary = Diary.new 
      expect(diary.all).to eq([])
    end
  end
end
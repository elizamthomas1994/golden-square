require 'diary'

RSpec.describe Diary do
  context 'initially' do
    it 'takes empty list of entries' do
      diary = Diary.new
      expect(diary.all).to eq []
    end
  end
end
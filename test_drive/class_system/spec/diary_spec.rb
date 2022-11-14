require 'diary'
require 'diary_entry'

RSpec.describe Diary do
  context 'when we add a diary entry' do
    it 'adds diary entry to the diary' do
      diary = Diary.new
      diary_entry = DiaryEntry.new("My Title", "My Contents")
      diary.add(diary_entry)
      expect(diary.all).to eq ["My Title", "My Contents"]
    end
  end
end
require 'diary'
require 'diary_entry'

RSpec.describe 'integration' do
  context 'when we add a diary entry' do
    it 'adds diary entry to the diary' do
      diary = Diary.new
      diary_entry = DiaryEntry.new("my title", "my contents")
      diary.add(diary_entry)
      expect(diary.all).to eq [diary_entry]
    end
  end
end
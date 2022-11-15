require 'diary_entry'

RSpec.describe DiaryEntry do
  it 'constructs' do
    diary_entry = DiaryEntry.new('my_title', 'my_contents')
    expect(diary_entry.title).to eq 'my_title'
    expect(diary_entry.contents).to eq 'my_contents'
  end

  describe '#count_words' do
    it 'returns zero if contents is empty' do
      diary_entry = DiaryEntry.new('my_title', '')
      expect(diary_entry.count_words).to eq 0
    end

    it 'returns one if contents is one word' do
      diary_entry = DiaryEntry.new('my_title', 'two')
      expect(diary_entry.count_words).to eq 1
    end

    it 'counts the words in the contents' do
      diary_entry = DiaryEntry.new('my_title', 'one two three four')
      expect(diary_entry.count_words).to eq 4
    end
  end

  describe '#reading_time' do
    it 'fails if wpm is zero' do
      diary_entry = DiaryEntry.new("my_title", "hello world")
      expect { diary_entry.reading_time(0) }.to raise_error "WPM must be positive."
    end


    it 'returns zero if contents is empty' do
      diary_entry = DiaryEntry.new('my_title', '')
      expect(diary_entry.reading_time(2)).to eq 0
    end

    it 'returns one if contents is one word' do
      diary_entry = DiaryEntry.new('my_title', 'two')
      expect(diary_entry.reading_time(2)).to eq 1
    end

    it 'returns a reading time for the contents' do
      diary_entry = DiaryEntry.new('my_title', 'one two three four five')
      expect(diary_entry.reading_time(2)).to eq 3
    end
  end

  describe '#reading_chunk' do
    context 'given a contents that is fully readable in the given time' do
      it 'returns the full contents' do
        diary_entry = DiaryEntry.new("my_title", ("Hello " * 200))
        expect(diary_entry.reading_chunk(100, 5)).to eq ("Hello " * 200)
      end
    end

    context 'given a contents that is not fully readable in the given time' do
      it 'returns a portion of the contents' do
        diary_entry = DiaryEntry.new("my_title", ("Hello " * 10))
        chunk = diary_entry.reading_chunk(3, 3)
        expect(chunk).to eq ("Hello " * 9)
      end

      it 'returns the next portion of contents when called again' do
        diary_entry = DiaryEntry.new('my_title', ("Hello " * 10))
        diary_entry.reading_chunk(3, 3)
        chunk = diary_entry.reading_chunk(3, 3)
        expect(chunk).to eq "Hello "
      end

      it 'restarts the reading of the whole text' do
        diary_entry = DiaryEntry.new('my_title', ("Hello " * 10))
        diary_entry.reading_chunk(3, 3)
        diary_entry.reading_chunk(3, 3)
        chunk = diary_entry.reading_chunk(3, 3)
        expect(chunk).to eq ("Hello " * 9)
      end
    end
  end
end
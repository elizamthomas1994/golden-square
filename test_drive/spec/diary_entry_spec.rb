require 'diary_entry'

RSpec.describe DiaryEntry do
  it "constructs" do
    diary_entry = DiaryEntry.new("my_title", "my_contents")
    expect(diary_entry.title).to eq "my_title"
    expect(diary_entry.contents).to eq "my_contents"
  end
  
  describe '#count_words' do
    it "returns the number of words in the contents" do
      diary_entry = DiaryEntry.new("my_title", "some contents here")
      expect(diary_entry.count_words).to eq 3
    end

    it "returns zero when contents is empty" do
      diary_entry = DiaryEntry.new("my_title", "")
      expect(diary_entry.count_words).to eq 0
    end
  end

  describe '#reading_time' do
    context "given an integer for wpm such as (200)" do
      it "returns minutes it takes to read contents rounded to closest whole number" do
        diary_entry = DiaryEntry.new("my_title", ("hello " * 450))
        expect(diary_entry.reading_time(200)).to eq 3
      end
    end

    context "given a wpm of 0" do
      it 'returns an error' do
        diary_entry = DiaryEntry.new("my_title", (""))
        expect{ diary_entry.reading_time(0) }.to raise_error "reading speed must be above 0"
      end
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
require 'music_tracker'

RSpec.describe MusicTracker do
  context 'given no tracks' do
    it 'returns an empty list' do
      music_tracker = MusicTracker.new
      expect(music_tracker.list).to eq []
    end
  end

  context 'given a track' do
    it 'returns tracklist' do
      music_tracker = MusicTracker.new
      music_tracker.add("Welcome To The Jungle")
      expect(music_tracker.list).to eq ["Welcome To The Jungle"]
    end
  end

  context 'given multiple tracks' do
    it 'returns tracklist' do
      music_tracker = MusicTracker.new
      music_tracker.add("Welcome To The Jungle")
      music_tracker.add("Master of Puppets")
      expect(music_tracker.list).to eq ["Welcome To The Jungle", "Master of Puppets"]
    end
  end

  context 'given a non-string element' do
    it 'returns error' do
      music_tracker = MusicTracker.new
      expect{ music_tracker.add(100) }.to raise_error "Invalid track name"
    end
  end
end
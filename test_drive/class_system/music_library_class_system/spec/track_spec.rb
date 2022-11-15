require 'track'

RSpec.describe Track do
  it 'is an instance of' do
    expect(Track.new('title', 'artist')).to be_an_instance_of Track
  end

  describe '#matches?' do
    it 'returns true when title or artist includes the keyword' do
      track_1 = Track.new('title_1', 'artist_1')
      expect(track_1.matches?('title')).to eq true
    end
  end

  it 'returns false when title or artist does not include the keyword' do
    track_1 = Track.new('title_1', 'artist_1')
    expect(track_1.matches?('pizza')).to eq false
  end
end
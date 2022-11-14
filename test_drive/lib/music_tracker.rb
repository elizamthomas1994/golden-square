class MusicTracker
  def initialize
    @tracklist = []
  end

  def add(track) # track is a string that represents song listened to
    # adds track to list
    # returns nothing
    # fails if track is not a string
    fail "Invalid track name" if !track.is_a? String
    @tracklist << track
  end

  def list
    # returns list of tracks
    @tracklist
  end
end
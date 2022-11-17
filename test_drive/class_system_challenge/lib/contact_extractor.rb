class ContactExtractor
  def initialize(diary) #diary represents diary object
    @diary = diary
  end

  def diary_searcher
    fail "Diary is empty" if @diary == []
    
    @diary.all.flat_map do |entry|
      entry.contents.scan(/0[0-9]{10}/)
    end
  end
end
# 1 - gets all diary entries
diary = Diary.new
first_entry = Track.new("Hi I am Eliza")
second_entry = Track.new("Today I went shopping")
diary.add(first_entry)
diary.add(second_entry)
diary.all # => [first_entry, second_entry]

# 2 - searches by keyword
library = MusicLibrary.new
track_1 = Track.new("Carte Blanche", "Veracocha")
track_2 = Track.new("Synaesthesia", "The Thrillseekers")
library.add(track_1)
library.add(track_2)
library.search_by_title("Carte") # => [track_1]

# 3 - searches by substring too
library = MusicLibrary.new
track_1 = Track.new("Carte Blanche", "Veracocha")
track_2 = Track.new("Synaesthesia", "The Thrillseekers")
library.add(track_1)
library.add(track_2)
library.search_by_title("aes") # => [track_2]

# 4 - if no results, search yields empty list
library = MusicLibrary.new
track_1 = Track.new("Carte Blanche", "Veracocha")
track_2 = Track.new("Synaesthesia", "The Thrillseekers")
library.add(track_1)
library.add(track_2)
library.search_by_title("zzz") # => []

# 5 - formats individual tracks
track = Track.new("Carte Blanche", "Veracocha")
track.format # => "Carte Blanche by Veracocha"
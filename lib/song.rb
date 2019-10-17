require 'pry'
class Song
  attr_accessor :artist, :name
  
  @@all = []
  def initialize(name)
    @name = name
    #@artist = artist
    save
  end
  
  def save 
    @@all << self 
  end 
  
  def self.all
    @@all
  end

  def self.new_by_filename(file)
    song_info = file.chomp(".mp3").split(" - ")
    song = Song.new(song_info[1])
    song.artist_name = song_info[0]
    song
  end
  
  # def self.new_by_filename(filename)
  #   artist_obj,song = filename.split(" - ")
  #   new_song = self.new(song)
  #   new_song.artist_name = artist_obj
  #   new_song
  # end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self) unless artist.songs.include?(self)
  end
end
require 'pry'
class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def self.all 
    @@all
  end
  
  def add_song(song)
    song.artist = self unless song.artist == self
  end

  # def self.find_or_create_by_name(name)
  #   if self.find(name)
  #     self.find(name)
  #   else
  #     self.create(name)
  #   end
  # end
  
    def self.find_or_create_by_name(name)
    ## SOLUTION 1
    self.find(name) ? self.find(name) : self.create(name)
    ## SOLUTION 2
    # find = self.all.find {|artist| name == artist.name }
    # if find
    #   find
    # else 
    #   self.new(name).tap{|artist| artist.save }
    # end

    ## SOLUTION 3
    # self.find(name) || self.create(name)

    ## SOLUTION 4
    # self.all.find {|artist| name == artist.name } || self.new(name).tap{|artist| artist.save }
  end
  
  def songs
    Song.all.select{|song| song.artist == self}
  end 

  def self.find(name)
    self.all.detect { |artist| artist.name == name }
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def print_songs
    songs_array = songs
    songs_array.each do |song|
      puts song.name 
    end 
  end
end
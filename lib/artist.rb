require 'pry'
class Artist 
  attr_accessor :name
  attr_reader :songs
  #owns songs, has many songs
  @@all = []
  def initialize(name)
    @name = name
    save
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def add_song(song)
    # binding.pry
    song.artist = self
  end
  
  def songs
    Song.all.select{|song| song.artist == self}
  end
  
  def self.find_or_create_by_name(singer)
    Artist.new(singer)
    @@all.each do |artist| 
      if artist.name == singer 
        return artist
      end
    end
  end
  
  def print_songs
    songs.each {|song| puts song.name}
  end
end

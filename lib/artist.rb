require 'pry'

class Artist 
  
  @@all = []
  
  attr_accessor :name, :song
  
  def initialize(name)
    @@all << self
    @name = name
  end
  
  def self.all
    @@all
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def songs 
    Song.all.select {|song|
    song.artist == self}
  end
  
  def self.create(name)
    self.new(name)
  end
  
  def self.find(name)
    self.all.find do |artist|
      artist.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    self.find(name) || self.create(name)
  end
  
  def print_songs
    songs.each do |song|
      puts song.name
    end
  end
end
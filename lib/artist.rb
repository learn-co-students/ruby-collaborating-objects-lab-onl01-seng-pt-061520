require "pry"
class Artist
  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def add_song(song)
    # receives instance of a Song and associates it belongs to this Artist instance
    @songs << song
    song.artist = self
  end

  def songs
    #instance var will only show this Artist songs
    @songs
        #binding.pry
  end

  def self.find_or_create_by_name(name_str)
    #binding.pry
    if self.all.detect {|n| n.name == name_str}.nil?
      name_str = Artist.new(name_str)
    else
      self.all.detect {|n| n.name == name_str}
    end
  end

  def print_songs
    #outputs the names of all songs associated
    #@songs
    @songs.select {|song| puts song.name }
  end

end

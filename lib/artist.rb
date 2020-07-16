class Artist 
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name 
    @@all << self 
  end 
  
  def self.all
    @@all 
  end 
  
  def add_song(song)
    song.artist = self
    
  end 
  
  def songs
    @songs = Song.all.select {|song| song.artist == self}
  end 
  
  def self.find_or_create_by_name(artist)
   @@all.each do |art|
      if art.name == artist 
        return art 
      end 
    end 
    Artist.new(artist)
    
  end 
  
  
  def print_songs
    Song.all.select{|song| song.artist == self}.each do |songo|
      puts songo.name 
    end 
  end 
end 
    
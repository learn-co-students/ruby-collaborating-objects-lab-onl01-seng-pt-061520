class Song
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(self)
  end
  
  def self.new_by_filename(file)
        parsed = file.split(" - ")
        artist = parsed[0]
        name = parsed[1]
        song = Song.new(name)
        song.artist_name = artist
        song
      end
    end
    
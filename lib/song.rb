class Song
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name = nil)
    @name = name
    @artist = self.artist
    save
  end

  def save
    @@all << self
  end
 
  def self.all
    @@all
  end
  
  def self.new_by_filename(filename)
    song = self.new
    song_array = filename.split(" - ")
    song.name = song_array[1]
    a = Artist.new(song_array[0])
    a.add_song(song)
    song
  end
  
  def artist_name=(name)
    a = Artist.find_or_create_by_name(name)
      self.artist = a
  end
  
end
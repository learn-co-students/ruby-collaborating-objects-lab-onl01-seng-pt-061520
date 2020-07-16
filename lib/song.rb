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
  
  def self.new_by_filename(file)
    a = file.split("/")[-1]
    # puts a
    a = a.split(" - ")
    song =  Song.new(a[1])
    b = Artist.find_or_create_by_name(a[0])
    b.add_song(song)
    song
  end 
  
   def artist_name=(nemo)
    @artist = Artist.find_or_create_by_name(nemo)
  end 
  
end 
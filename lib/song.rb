class Song
  def initialize(name)
    @name = name
    @@all << self
  end

  attr_accessor :name, :artist

  @@all= []

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    #parse a filename to find the song-name and artist
    # every file separates with (" - ")
    filename_arr = filename.split(/\s-\s|\./)
    #create a new song instance using the string
    new_song = Song.new(filename_arr[1])
    new_song.artist_name=(filename_arr[0])
    #associate the new song with an artist
    #binding.pry
    #new_song.artist = Artist.new(filename_arr[0])
    #filename_arr[1].artist = filename_arr[0]
    #filename_arr[1] = artist_name=(filename_arr[0])
    # binding.pry
    #return the new song instance
    new_song

  end

  def artist_name=(artist_name)
    #artist_name = Artist.new(artist_name)
    # Either we have to create that Artist instance
    artist_name = Artist.find_or_create_by_name(artist_name)
    #binding.pry
    # undefined if called by Artist.artist_name
    artist_name.add_song(self)

    # Or if it exists / find that Artist instance
    # To achieve this, we'll need to collaborate with the Artist class. We want
    # to send an artist's name (a string--remember we are getting this from the
    # parsed filename) to the Artist class to achieve the functionality described
    # above in #1 and #2. This sounds like a great place to use method
    # Artist.find_or_create_by_name.

    #Assign the song to the artist
    #collaborate with the Artist class by calling Artist#add_song(some_song)
    #method
  end
end

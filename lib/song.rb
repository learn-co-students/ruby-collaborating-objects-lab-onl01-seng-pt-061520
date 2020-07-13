class Song
    attr_accessor :name,:artist
      @@all = []
      
    def initialize(name)
         @name=name
         @artist=artist
         @@all << self
    end
   
    def self.create_by_name(name)
        song=self.new
        song.name=name
        @@all << song
        song
    end
    def self.find_by_name(name)
      @@all.find {|song|song.name == name}
    end
  
    def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)
    end
    def self.new_by_filename(file)
        song_title=file.chomp(".mp3").split(" - ")
        song=Song.new(song_title[1])
        song.artist_name =song_title[0]
        song
    end
    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end


    def self.all
        @@all
    end
end
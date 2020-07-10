class Artist
    attr_accessor :name, :songs
    @@all =[]

    def initialize (name)
        @name = name
        @songs = []
        save
    end

def save
    @@all << self
end

def self.all
    @@all
end

def add_song(song)
    self.songs << song
end


def self.find_or_create_by_name(art_name)
  found = self.all.find {|artist| artist.name == art_name}
  if found
    found
  else
    new_artist = self.new(art_name)
    new_artist.save
    new_artist
  end

end

def print_songs
    @songs.each do |song|
        puts song.name
    end
end
end
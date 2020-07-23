class Artist
    attr_accessor :name, :songs

@@all = []

    def initialize(name)
        @name = name
        @songs =[]
        @@all << self
    end

    def add_song(song)
        self.songs << song
    end

    def self.all
        @@all
    end

    def self.find(name) 
        self.all.find {|artist| artist.name == name}
    end

    def self.create(name) 
        artist = self.new(name)
        artist.name = name
        artist
    end

    def self.find_or_create_by_name(name)
        self.find(name) || self.create(name)
    end

    def print_songs
        songs.each {|song| puts song.name}
    end

end
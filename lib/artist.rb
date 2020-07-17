class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        @songs << song
        song.artist = self
    end

    def songs
        Song.all.select {|s| s.artist == self}
    end

    def self.find_or_create_by_name(name)
        if @@all.find {|a| a.name = name}
            return @@all.find {|a| a.name == name}
        else
            self.new(name)
        end
    end

    def print_songs
        @songs.each {|s| puts s.name}
    end

end
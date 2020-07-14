class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize (name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song = self.new(filename)
        song.name = filename.split("-").map(&:strip)[1]
        song.artist = Artist.find_or_create_by_name(filename.split("-").map(&:strip)[0])
        song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)

    end
end


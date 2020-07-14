require 'pry'
class Artist
    attr_accessor :name, :song

    @@all = []

    def initialize (name)
        @name = name
        @@all << self
        
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.all
       
        @@all
    end
    
    def self.find_or_create_by_name(name)
       

        if artist = self.all.find{|artist| artist.name == name}
          artist
       else 
        song = self.new(name)
        song
       end
        
    end

    def print_songs
        songs = Song.all.select {|song| song.artist == self}
        songs.map {|song| puts song.name}
    end








    #     all.select do |artist| 
    #         if artist.name == name
    #             artist
    #         else
    #             artist = self.new(name)
    #             artist
    #         end
        
    #     end
        
    # end

end

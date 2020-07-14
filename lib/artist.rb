class Artist
  attr_accessor :name
  @@all = []
  @@songs = []
 
 
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def add_song(song)
    song.artist = self
    @@songs << song
  end
  
  def songs
    @@songs.select {|song| song.artist == self}
  end
  
  def self.find_or_create_by_name(names)
    new_array = []
   check = @@all.any? {|i| i.name == names}
    if check
      @@all.each do |i|
        if i.name == names
          new_array << i
        end
      end
      new_array[0]
    else
      self.new(names)
    end
  end
  
  def print_songs
    @@songs.each do |i|
      if i.artist == self
        puts i.name
      end
    end
  end

end
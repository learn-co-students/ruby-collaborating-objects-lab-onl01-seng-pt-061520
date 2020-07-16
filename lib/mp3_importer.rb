class MP3Importer 
  attr_accessor :path
  def initialize(path)
    @path = path 
  end 
  
  def files 
    a = []
    Dir.entries(@path).each do |song|
      if song.include?("mp3")
        a << song 
      end 
    end 
    a
  end 
  
  def import
    a = self.files 
    a.each do |song|
      Song.new_by_filename(song)
    end 
  end 
end
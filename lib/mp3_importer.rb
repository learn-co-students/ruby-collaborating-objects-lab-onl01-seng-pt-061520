class MP3Importer
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end 
  
  def files
    f = Dir[@path + "/*.mp3"]
    new_array = []
    f.each do |file|
      file[@path + "/"] = ""
      new_array << file
    end
    #Dir[@path + "/*.mp3"].select {|f| File.file? f}
    #Dir.entries("#{@path}" + "/*.mp3").select {|f| !File.directory? f}
    new_array
  end 
  
  def import
    self.files.each{ |filename| Song.new_by_filename(filename) }
  end
end
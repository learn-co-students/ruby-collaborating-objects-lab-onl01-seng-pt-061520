require 'pry'
class MP3Importer
  
  attr_accessor :path
  
  def initialize(path)
  @path = path 
  end 
  
  def files()
    mp3 = Dir.new("spec/fixtures/mp3s")
    mp3.children
  end 
  

  
  def import 
   files.each {|song| Song.new_by_filename(song)} 
  end
end 
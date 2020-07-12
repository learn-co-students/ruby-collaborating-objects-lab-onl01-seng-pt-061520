require "pry"
class MP3Importer

  def initialize(path)
    @path = path
  end

  attr_accessor :path

  def files
    file_paths = Dir[path+"/*.mp3"]
    filenames = file_paths.map { |p| File.basename(p) }
    #binding.pry
  end

  def import
    files.each { |file| Song.new_by_filename(file) }
    # binding.pry
  end

  # You should write code that responds to MP3Importer.new('./spec/fixtures').import.
  # Google around for how to get a list of files in a directory! Make sure you
  # only get .mp3 files.


end

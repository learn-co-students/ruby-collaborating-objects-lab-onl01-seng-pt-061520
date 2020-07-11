require 'pry'

class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        #Dir["#{path}/*"].map{|mp3| mp3.split("#{path}/")}.flatten.reject{|a| a.empty?}
        Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "")}
    end

    def import
        files.each{|file| Song.new_by_filename(file)}
    end
end
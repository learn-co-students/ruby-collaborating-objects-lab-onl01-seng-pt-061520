class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        files = Dir.glob("*.mp3", base: path)
    end

    def import
        list = self.files
        list.each {|s| Song.new_by_filename(s)}
    end

end
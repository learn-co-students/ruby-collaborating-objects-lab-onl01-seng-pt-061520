describe 'Song' do

  before(:example) {
    Song.class_variable_set(:@@all, [])
  }

  describe '#initialize with a name' do
    it 'accepts a name for the song and makes it accessible through an attribute accessor' do
      song = Song.new('Man in the Mirror')
      expect(song.name).to eq('Man in the Mirror')
    end
  end

  describe '#name=' do
    it 'sets the song name' do
      song = Song.new('Man in the Mirror')
      song.name = 'Thriller'
      expect(song.name).to eq('Thriller')
    end
  end

  describe '#artist=' do
    it 'sets the artist object to belong to the song' do
      song = Song.new('Man in the Mirror')
      new_artist_object = Artist.new('King of Pop')
      song.artist = new_artist_object
      expect(song.artist).to eq(new_artist_object)
    end
  end



  
end

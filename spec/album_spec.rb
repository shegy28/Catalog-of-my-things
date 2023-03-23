require_relative './Ruby_Classes/music_album'

describe MusicAlbum do
  context 'When MusicAlbum is on_spotity to true' do
    first_music_album = MusicAlbum.new('name', Time.new(2021, 1, 1), true)
    it 'Should return musicAlbum class instance' do
      expect(first_music_album).to be_an_instance_of MusicAlbum
    end
  end

  context 'When MusicAlbum is on_spotity to false' do
    second_music_album = MusicAlbum.new('name', Time.new(2021, 1, 1), false)
    it 'Should return musicAlbum class instance' do
      expect(second_music_album).to be_an_instance_of MusicAlbum
    end
  end
end

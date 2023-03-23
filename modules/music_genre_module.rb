require_relative '../Ruby_Classes/music_genre'
require 'json'

module MusicGenresDataController
  def retrieve_genres
    if File.exist?('./json_data_files/genre.json') && !File.empty?('./json_data_files/genre.json')
      JSON.parse(File.read('./json_data_files/genre.json')).map do |genre|
        Genre.new(genre['name'])
      end
    else
      []
    end
  end

  def save_genres
    data = []
    @genres.each do |genre|
      data.push({ name: genre.name })
    end
    open('./json_data_files/genre.json', 'w') { |f| f << JSON.generate(data) }
  end
end

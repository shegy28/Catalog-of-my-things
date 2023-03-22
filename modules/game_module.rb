require_relative '../Ruby_Classes/game'
require 'json'

module GameDataController
    def retrieve_games
      if File.exist?('./json_data_files/game.json') && !File.empty?('./json_data_files/game.json')
        JSON.parse(File.read('./json_data_files/game.json')).map do |game|
          Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'])
        end
      else
        []
      end
    end
  
    def save_games
      data = []
      @game.each do |game|
        data.push({ publish_date: game.publish_date, multiplayer: game.multiplayer, last_played_at: game.last_played_at})
      end
      open('./json_data_files/game.json', 'w') { |f| f << JSON.generate(data) }
    end
end
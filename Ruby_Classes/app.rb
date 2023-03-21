require_relative './author'
require_relative './game'
require_relative './item'

class App
  def initialize
    @author = []
    @game = []
  end

  def list_all_games
    if @game.empty?
      puts 'No games found'
    else
      @game.each do |game|
        puts "Published date: #{game.publish_date} |  Last Played on:  #{game.last_played_at}"
      end
    end
  end

  def list_all_authors
    if @author.empty?
      puts 'No authors found'
    else
      @author.each do |author|
        puts "First Name: #{author.first_name} Last Name: #{author.last_name}"
      end
    end
  end

  def add_game
    print 'Publication Date:  '
    publish_date = gets.chomp
    print 'multiplayer status true or false:  '
    multiplayer = gets.chomp
    print 'Last played date:  '
    last_played_at = gets.chomp
    game = Game.new(publish_date, multiplayer, last_played_at)
    @game << game
    puts 'Game created successfully'
  end
end

require_relative './author'
require_relative './game'
require_relative './item'
require_relative './music_album'
require_relative './music_genre'
require_relative '../modules/music_album_module'
require_relative '../modules/music_genre_module'
require_relative '../modules/game_module'
require_relative '../modules/author_module'

class App
  include MusicAlbumDataController
  include MusicGenresDataController
  include GameDataController
  include AuthorDataController

  def initialize
    @genres = retrieve_genres
    @music_albums = retrieve_albums
    @author = retrieve_authors
    @game = retrieve_games
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
        puts "Full Name: #{author.first_name} #{author.last_name}"
      end
    end
  end

  def add_game
    print "Author's First name: "
    first_name = gets.chomp
    print "Author's Last name: "
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @author << author
    print 'Publication Date:  '
    publish_date = gets.chomp
    print 'multiplayer status true or false:  '
    multiplayer = gets.chomp
    print 'Last played date:  '
    last_played_at = gets.chomp
    game = Game.new(publish_date, multiplayer, last_played_at)
    game.add_author = author
    @game << game
    puts 'Game created successfully'
  end

  def list_all_music_album
    puts 'Music Albums'
    @music_albums.each do |music_album|
      puts "Name: #{music_album.name}, Publish Date: #{music_album.publish_date}, On Spotify: #{music_album.on_spotify}"
    end
  end

  def list_all_genres
    puts 'Genres'
    @genres.each do |genre|
      puts "Name: #{genre.name}"
    end
  end

  def add_music_album
    print 'Please, type the album name: '
    name = gets.chomp

    print 'Date of publish [Enter date in format (yyyy-mm-dd)]: '
    publish_date = get_date_from_user(gets.chomp)
    return unless publish_date

    print 'Has present in spotify? [Y/N]: '
    on_spotify = gets.chomp.downcase == 'y' || false

    @music_albums << MusicAlbum.new(name, publish_date, on_spotify)
    puts 'Album created successfully'
  end

  def get_date_from_user(data)
    Date.parse(data)
  rescue ArgumentError
    puts 'Wrong date format'
    false
  end

  def save_data
    # save_books
    # save_labels
    save_authors
    save_games
    save_albums
    save_genres
  end
end

require_relative './author'
require_relative './game'
require_relative './item'
require_relative './music_album'
require_relative './music_genre'
require_relative '../modules/music_album_module'
require_relative '../modules/music_genre_module'

class App
  include MusicAlbumDataController
  include MusicGenresDataController

  def initialize
    @genres = retrieve_genres
    @music_albums = retrieve_albums
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

  def list_all_music_album
    puts "Music Albums\n"
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

    album = MusicAlbum.new(name, publish_date, on_spotify)

    genre = add_genre

    genre.add_item(album)
    puts 'Album created successfully'
    @music_albums << album
  end

  def add_genre
    print "Add Music Genre eg 'Rap'\n\n"
    print 'Genre name: '
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @genres << genre
    genre
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
    # add_author
    # save_game
    save_albums
    save_genres
  end
end

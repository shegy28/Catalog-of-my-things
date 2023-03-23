class Menu
  def initialize(app)
    @app = app
  end

  puts "Welcome to My Catalog of Things!\n\n"

  def menu
    puts 'Please choose an option by selecting a number'

    @list = {
      1 => 'List all books',
      2 => 'List all music albums',
      3 => 'List of games',
      4 => 'List all genres',
      5 => 'List all labels',
      6 => 'List all authors',
      7 => 'Add a book',
      8 => 'Add a music album',
      9 => 'Add a game',
      10 => 'exit'
    }

    @list.each do |id, opt|
      puts "#{id}: #{opt}"
    end

    gets.chomp.to_i
  end

  def start
    loop do
      case menu
      when 1
        @app.list_all_books
      when 2
        @app.list_all_music_album
      when 3
        @app.list_all_games
      when 4
        @app.list_all_genres
      when 5
        # @app.list_all_labels
      when 6
        @app.list_all_authors
      when 7
        # @app.add_book
      when 8
        @app.add_music_album
      when 9
        @app.add_game
      when 10
        @app.save_data
        puts 'Thank you for using this app!'
        exit
      else
        puts 'Please choose a number between 1 and 10'
      end
    end
  end
end

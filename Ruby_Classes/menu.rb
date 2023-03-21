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
        '.@app'
      when 2
        '..@app'
      when 3
        @app.list_all_games
      when 4
        '/..@app'
      when 5
        '....@app'
      when 6
        @app.list_all_authors
      when 7
        '.../.@app'
      when 8
        '//,,@app'
      when 9
        @app.add_game
      when 10
        puts 'Thank you for using this app!'
        exit
      else
        puts 'Please choose a number between 1 and 7'
      end
    end
  end
end

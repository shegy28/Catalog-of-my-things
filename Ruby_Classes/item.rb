require 'date'

class Item
  attr_reader :genre, :author, :label
  attr_accessor :publish_date

  def initialize(id:, publish_date:, archived: false)
    @id = id ||  Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    current_year = Date.today.year
    date = Date._parse(@publish_date)
    publish_year = current_year - date[:year]
    publish_year > 10
  end

  def genre=(genre)
    @genre = genre
    @genre.add_item(self) unless @genre.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end
end

require 'date'
class Item
  attr_accessor :id, :author, :genre, :source, :publish_date

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archive = false
  end

  def can_be_archived?
    current_year = Date.today.year
    date = Date._parse(@publish_date)
    publish_year = current_year - date[:year]
    publish_year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end

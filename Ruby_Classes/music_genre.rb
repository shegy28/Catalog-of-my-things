class Genre
  attr_accessor :items, :name

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
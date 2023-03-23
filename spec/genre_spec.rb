require_relative '../Ruby_Classes/music_genre'
require_relative '../Ruby_Classes/item'

describe Genre do
  context 'It should create genre and add items' do
    test_genre = Genre.new('Comedy')
    it 'Should return a Genre class instance' do
      expect(test_genre.name).to eq 'Comedy'
    end

    it 'should add the input item to the collection of items' do
      item = Item.new(id: nil, publish_date: Time.new(2021, 1, 1))
      test_genre.add_item(item)
      expect(test_genre.items.length).to eq 1
    end
  end
end

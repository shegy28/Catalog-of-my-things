require 'spec_helper'



RSpec.describe Author do
  describe "#initialize" do
    it "creates a new Author instance with the given first and last name" do
      author = Author.new("John", "Doe")
      expect(author.first_name).to eq("John")
      expect(author.last_name).to eq("Doe")
      expect(author.items).to be_empty
    end
  end

  describe "#add_item" do
    it "adds an item to the author's collection and sets the author attribute on the item" do
      author = Author.new("Jane", "Smith")
      item = Item.new("1991-10-10")
      author.add_item(item)
      expect(author.items).to include(item)
      expect(item.author).to eq(author)
    end
  end
end
# require 'spec_helper'


# describe Label do
#   describe '#initialize' do
#     it 'initializes a new Label instance with a unique id, title, color, and an empty items array' do
#       label = Label.new('My Label', 'red')
#       expect(label).to be_a(Label)
#       expect(label.id).to be_an(Integer)
#       expect(label.title).to eq('My Label')
#       expect(label.color).to eq('red')
#       expect(label.items).to eq([])
#     end
#   end

#   describe '#add_item' do
#     it 'adds a new item to the label and sets the item label attribute to the label instance' do
#       label = Label.new('My Label', 'red')
#       item = Item.new('My Item')
#       expect(label.items).to eq([])
#       expect(item.label).to be_nil

#       label.add_item(item)

#       expect(label.items).to include(item)
#       expect(item.label).to eq(label)
#     end
#   end
# end

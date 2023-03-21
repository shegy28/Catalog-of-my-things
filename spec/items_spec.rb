require 'spec_helper'

describe Item do
    describe "#initialize" do
        let(:publish_date) { "2022-01-01" }
        let(:item) { Item.new(publish_date) }

        it "sets a random id" do
            expect(item.id).to be_between(1, 1000)
        end

        it "sets the publish date" do
        expect(item.publish_date).to eq(publish_date)
        end

        it "sets archive to false by default" do
        expect(item.archive).to be_falsey
        end
    end

    describe '#can_be_archived?' do
      it 'returns true if publish date is more than 10 years ago' do
        
        item = Item.new('12-12-2000')
        expect(item.can_be_archived?).to eq(true)
      end
  
      it 'returns false if publish date is less than 10 years ago' do
        item = Item.new('12-12-2023')
        expect(item.can_be_archived?).to eq(false)
      end
    end
  
    describe '#move_to_archive' do
      it 'sets @archived to true if item can be archived' do
        item = Item.new('12-12-2000')
        item.move_to_archive
        expect(item.instance_variable_get(:@archived)).to eq(true)
      end
  
      it 'does not set @archived to true if item cannot be archived' do
        item = Item.new('12-12-2023')
        item.move_to_archive
        expect(item.instance_variable_get(:@archived)).to eq(nil)
      end
    end
  
    describe '#add_author=' do
      it 'adds the item to the author\'s items array' do
        author = Author.new('John Smith', 'cow')
        item = Item.new('12-12-2023')
        item.add_author = author
        expect(author.items).to include(item)
      end
  
      it 'does not add the item to the author\'s items array if it is already there' do
        author = Author.new('John Smith', 'foul')
        item = Item.new('12-12-2023')
        author.items << item
        item.add_author = author
        expect(author.items.count(item)).to eq(1)
      end
    end
  end
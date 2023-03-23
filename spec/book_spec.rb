require_relative 'spec_helper'

describe Book do
  let(:publish_date) { '2020-01-01' }
  let(:book) { described_class.new('Example Book', 'Example Publisher', 'Good', publish_date) }

  describe '#initialize' do
    it 'sets the name attribute' do
      expect(book.name).to eq 'Example Book'
    end

    it 'sets the publisher attribute' do
      expect(book.publisher).to eq 'Example Publisher'
    end

    it 'sets the cover_state attribute' do
      expect(book.cover_state).to eq 'Good'
    end

    it 'sets the publish_date attribute' do
      expect(book.publish_date).to eq '2020-01-01'
    end

    it 'sets the id attribute to a random number between 1 and 1000' do
      expect(book.id).to be_between(1, 1000)
    end

    it 'sets the archived attribute to false' do
      expect(book.archived).to eq false
    end

    it 'move the book to archived' do
      book.cover_state = 'bad'
      book.move_to_archive
      expect(book.archived).to be true
    end
  end
end

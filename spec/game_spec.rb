require 'spec_helper'

describe Game do
  describe '#initialize' do
    let(:publish_date) { '2022-01-01' }
    let(:multiplayer) { true }
    let(:last_played_at) { '2022-03-15' }

    it 'sets the publish_date, multiplayer, and last_played_at attributes' do
      game = Game.new(publish_date, multiplayer, last_played_at)

      expect(game.publish_date).to eq(publish_date)
      expect(game.multiplayer).to eq(multiplayer)
      expect(game.last_played_at).to eq(last_played_at)
    end

    it 'sets the id attribute to a random number between 1 and 1000' do
      game = Game.new(publish_date, multiplayer, last_played_at)

      expect(game.id).to be_between(1, 1000)
    end

    it 'sets the archive attribute to false' do
      game = Game.new(publish_date, multiplayer, last_played_at)

      expect(game.instance_variable_get(:@archived)).to eq(false)
    end
  end

  describe '#can_be_archived?' do
    context 'when the game was last played over 2 years ago and can be archived' do
      let(:game) { Game.new('2000-01-01', true, '2019-01-01') }

      it 'returns true' do
        expect(game.can_be_archived?).to be_truthy
      end
    end

    context 'when the game was last played less than 2 years ago and can be archived' do
      let(:game) { Game.new('2020-01-01', true, '2021-01-01') }

      it 'returns false' do
        expect(game.can_be_archived?).to be_falsy
      end
    end

    context 'when the game was last played over 2 years ago but cannot be archived' do
      let(:game) { Game.new('2020-01-01', false, '2019-01-01') }

      it 'returns false' do
        expect(game.can_be_archived?).to be_falsy
      end
    end
  end
end

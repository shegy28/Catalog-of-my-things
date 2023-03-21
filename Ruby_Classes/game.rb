require_relative 'items.rb'

class Game < Item
    attr_accessor :multiplayer, :last_played_at
    def initialize(publish_date, multiplayer, last_played_at)
        super(publish_date)
        @publish_date = publish_date
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end

    def can_be_archived?
        current_year = Date.today.year
        date = Date._parse(@last_played_at)
        last_played = current_year - date[:year]

        if last_played > 2 && super
            true
        else
            false
        end
    end
end




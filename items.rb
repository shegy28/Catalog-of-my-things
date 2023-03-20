class Item
    def initialize(genre, author, source, label, publish_date, archive: false )
        @id = Random.rand(1..1000)
        @genre = genre
        @author = author
        @source = source
        @label = label
        @publish_date = publish_date
        @archive = archive
    end

    def can_be_archived?
        if @publish_date > 10
            true
        else
            false
        end
    end

    def move_to_archive
        @archived = true if can_be_archived?
    end
end


class Song
    attr_accessor :title, :artist, :duration, :next, :prev

    def initialize(title, artist, duration)
        @title = title 
        @artist = artist
        @duration = duration
        @next = nil
        @prev = nil
    end
end
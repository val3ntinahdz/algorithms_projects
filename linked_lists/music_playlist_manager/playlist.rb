require_relative 'song'

class Playlist
    attr_accessor :head, :tail, :current_song

    def initialize
        @head = nil
        @tail = nil
        @current_song = nil
    end

    def add_song
    end

    def remove_song(title)
    end 

    def play_next
    end

    def play_previous
    end

    def display
    end
end
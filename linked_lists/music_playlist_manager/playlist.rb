require_relative 'song'

class Playlist
    attr_accessor :head, :tail, :current_song

    def initialize
        @head = nil
        @tail = nil
        @current_song = nil
    end

    def add_song(title, artist, duration)
        # Create new song with title, artist and duration
        song = Song.new(title, artist, duration)
        if @head.nil?
            @head = song 
            @tail = song
            @current_song = song 
        else 
            # add the song at the end
            @tail.next = song 
            song.prev = @tail 
            @tail = song 
        end 
        puts "Song '#{title}' added to the playlist!"
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
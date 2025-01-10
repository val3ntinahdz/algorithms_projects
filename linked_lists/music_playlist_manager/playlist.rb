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
        # Remove song by title 
        current = @head 
        # 1. handle cases when current is head or tail
        while current 
            if current.title == title
                if current == @head 
                    @head = current.next 
                    @head.prev = nil if @head
                elsif current == @tail 
                    @tail = current.prev 
                    @tail.next = nil if @tail
                else 
                    current.prev.next = current.next 
                    current.next.prev = current.prev
                end
                puts "Song '#{title}' removed from the playlist"
                return
            end
            current = current.next
        end
        puts "Song '#{title}' not found!"
    end 

    def play_next
    end

    def play_previous
    end

    def display
    end
end
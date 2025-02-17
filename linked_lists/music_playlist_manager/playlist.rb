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
        # order songs by alphabetical order 
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
        if @current_song && @current_song.next # Checks the existence of the current song to access its next node and play it. 
            @current_song = @current_song.next 
            puts "Now playing '#{@current_song.title}' by #{@current_song.artist}"
        else 
            puts "End of the playlist! No more songs to play!"
        end
    end


    def play_previous
        if @current_song && @current_song.prev
            @current_song = @current_song.prev
            puts "Now playing '#{@current_song.title}' by #{@current_song.artist}"
        else 
            puts "End of the playlist. No more songs to play!"
        end
    end

    def display
        # code to display all the songs
        current = @head
        puts "Playlist:"
        while current 
            puts " #{current.title.} by #{current.artist} - #{current.duration}"
            current = current.next
        end

    end

    def order_songs
        # 1. locate the object = LinkedLIst (Playlist object)
        # 2. traverse the list starting from head
        current = @head 
        # 3. figure out how to access the nodes (representing the songs)
        song_names = []
        while current
            if current
                song_names << current.title
                current = current.next
            end
        end
        return @head

        return song_names.sort

        song_names[0] = @head
        @prev = nil 
        @next = nil

        i = 1

        song_names.range(i...n-1).each do |song|
            @new_node = Song.new(song)
            @new_node.next = song_names[0]
        end 

        # 4. convert the linked list into an array to utilize the method .sort()
    end
    
    def reverse_playlist
        # Pseudocode 
        # Traverse the playlist backward starting from the tail and print the songs.
        current = @tail
        # Use this to understand how .prev works in a doubly linked list.
        # 1. check if tail exists before traversing playlist backward
        while current
            puts "#{current.title} by #{current.artist} - #{current.duration}"
            current = current.prev 
        end
    end

    # Add Songs in Alphabetical Order

    # def order_songs 
    #     # order songs in alphabetical order

    # end 
    

    # def count_total
    #     # Display the number of songs in the playlist
    # end 

    # Modify the add_song method so songs are inserted in the correct position based on their title.
    # Count the Total Songs

    # Create a method to count and display the number of songs in the playlist.

end
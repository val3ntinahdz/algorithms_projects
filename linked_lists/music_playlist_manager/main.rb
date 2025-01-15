require_relative 'playlist'

def main 
    playlist = Playlist.new

    playlist.add_song("Vienna", "Billy Joel", "3:34")
    playlist.add_song("Hey Jude", "The Beatles", "7:05")
    playlist.add_song("Touch", "Daft Punk", "8:18")
    playlist.add_song("Smells Like Teen Spirit", "Nirvana", "5:01")
    playlist.add_song("De todas las flores", "Natalia Lafourcade", "5:22")
    playlist.add_song("RUN", "Joji", "3:15")
    playlist.add_song("Valentina", "Daniel Caesar", "2:34")
    playlist.add_song("cowboy like me", "Taylor Swift", "4:35")
    playlist.add_song("No. 1 Party Anthem", "Arctic Monkeys", "4:03")
    playlist.add_song("Selfless", "The Strokes", "4:00")
    playlist.add_song("I love you, i'm sorry", "Gracie Abrams", "2:37")

    puts "---------- Your Playlist!"
    playlist.display

   loop do 
    puts "Music Playlist Manager"
    puts "1. Add Song"
    puts "2. Remove Song"
    puts "3. Play Next"
    puts "4. Play Previous"
    puts "5. View Playlist"
    puts "6. Reverse playlist"
    puts "7. Exit"

    print "Enter your choice: "
    choice = gets.chomp

    case choice
    when '1'
        print 'enter song title: '
        title = gets.chomp 
        print 'enter artist: '
        artist = gets.chomp 
        print 'enter duration: '
        duration = gets.chomp
        playlist.add_song(title, artist, duration)
    when '2'
        print 'which song do you wanna remove? '
        title = gets.chomp
        playlist.remove_song(title)
    when '3'
        playlist.play_next
    when '4'
        playlist.play_previous
    when '5'
        playlist.display
    when '6'
        playlist.reverse_playlist
    when '7'
        puts 'goodbye budddyy'
        break
    else 
        puts 'Invalid choice. Try again.'
    end
   end
end

main
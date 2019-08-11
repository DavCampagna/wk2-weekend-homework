class Guest

  attr_reader :name, :favourite_song
  attr_accessor :wallet, :personal_playlist

    def initialize(name, money, favourite_song)
      @name = name
      @wallet = money
      @favourite_song = favourite_song
      @personal_playlist = []
    end

    def pay_for_room(room)
      @wallet -= room.price
    end

    def select_song_from_playlist(song)
      return song
    end

    def add_song_to_personal_playlist(song)
      @personal_playlist << song
    end

    def remove_song_from_personal_playlist(song)
      @personal_playlist.delete(song)
    end

    def cheer_to_favourite_song
      for song in @personal_playlist
        if song.name == @favourite_song
          return "Whoo!"
        end
      end
    end


end

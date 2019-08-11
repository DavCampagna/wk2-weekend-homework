class Room

attr_reader :name, :price, :capacity
attr_accessor :guests_in, :playlist

  def initialize(name, price, capacity, guests_in, playlist)
    @name = name
    @price = price
    @capacity = capacity
    @guests_in = guests_in
    @playlist = playlist
  end

  def take_a_guest(guest)
    @guests_in << guest
  end

  def lose_a_guest(guest)
    @guests_in.delete(guest)
  end

  def add_song_to_playlist(song)
    @playlist << song
  end

  def remove_song_from_playlist(song)
    @playlist.delete(song)
  end


end

class Karaoke_bar

attr_reader :name
attr_accessor :rooms, :till

  def initialize(name)
    @name = name
    @till = 0
    @rooms = rooms
  end

  def check_in(guest, room)
    room.take_a_guest(guest)
  end

  def check_out(guest, room)
    room.lose_a_guest(guest)
  end

  def add_song_to_rooms_playlist(song, room)
    room.add_song_to_playlist(song)
  end

  def remove_song_from_rooms_playlist(song, room)
    room.remove_song_from_playlist(song)
  end

  def capacity_limit(room)
    if room.guests_in.count == room.capacity
      x = room.capacity
      "Capacity limit of #{x} reached"
    elsif room.guests_in.count < room.capacity
      x = room.capacity - room.guests_in.count
      "Remaining capacity: #{x}"
    else room.guests_in.count > room.capacity
      x = room.guests_in.count - room.capacity
      "Capacity exceeded by #{x}"
    end
  end

  def take_guests_payment_for_room(guest, room)
    @till += room.price
    guest.pay_for_room(room)
  end


end

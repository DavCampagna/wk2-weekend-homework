require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../guest")
require_relative("../song")

class TestRoom < Minitest::Test

  def setup
    @song1 = Song.new("I cry in the shower")
    @song2 = Song.new("Smells like bee spirit")
    @song3 = Song.new("I will survive")

    @guest1 = Guest.new("Frannie Vavotici", 80.00, "I will survive")

    @room1 = Room.new("Room 1", 60.00, 5, [], [])
    @room2 = Room.new("Room 2", 60.00, 5, [@guest1], [@song2])
  end

  def test_room_name
    assert_equal("Room 1", @room1.name)
  end

  def test_room_price
    assert_equal(60.00, @room1.price)
  end

  def test_room_capacity
    assert_equal(5, @room1.capacity)
  end

  def test_room_guests_in
    assert_equal([], @room1.guests_in)
  end

  def test_room_playlist
    assert_equal([], @room1.playlist)
  end

  def test_can_take_a_guest
    @room1.take_a_guest(@guest1)
    assert_equal([@guest1], @room1.guests_in)
  end

  def test_can_lose_a_guest
    @room2.lose_a_guest(@guest1)
    assert_equal([], @room2.guests_in)
  end

  def test_add_song_to_playlist
    @room1.add_song_to_playlist(@song1)
    assert_equal([@song1], @room1.playlist)
  end

  def test_remove_song_from_playlist
    @room2.remove_song_from_playlist(@song2)
    assert_equal([], @room2.playlist)
  end


end

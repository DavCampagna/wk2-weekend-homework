require("minitest/autorun")
require("minitest/rg")
require_relative("../karaoke_bar")
require_relative("../room")
require_relative("../guest")
require_relative("../song")

class TestKaroke_bar < Minitest::Test

  def setup
    @song1 = Song.new("I cry in the shower")

    @room1 = Room.new("Room 1", 60.00, 5, [], [])
    @room2 = Room.new("Room 2", 80.00, 9, [@guest1], [@song1])
    @room3 = Room.new("Room 3", 100.00, 12, [], [])

    @guest1 = Guest.new("Frannie Vavotici", 120.00, "I will survive")

    @karaoke_bar1 = Karaoke_bar.new("Sing like nuts")

  end

  def test_karaoke_bar_name
    assert_equal("Sing like nuts", @karaoke_bar1.name)
  end

  def test_karaoke_bar_till
    assert_equal(0, @karaoke_bar1.till)
  end

  def test_checks_in_guest_into_room
    @karaoke_bar1.check_in(@guest1, @room1)
    assert_equal([@guest1], @room1.guests_in)
  end

  def test_checks_out_guest_from_room
    @karaoke_bar1.check_out(@guest2, @room2)
    assert_equal([], @room2.guests_in)
  end

  def test_add_song_to_rooms_playlist
    @karaoke_bar1.add_song_to_rooms_playlist(@song1, @room1)
    assert_equal([@song1], @room1.playlist)
  end

  def test_remove_song_from_rooms_playlist
    @karaoke_bar1.remove_song_from_rooms_playlist(@song1, @room2)
    assert_equal([], @room1.playlist)
  end

  def test_capacity_limit__full
    @karaoke_bar1.check_in(@guest1, @room1)
    @karaoke_bar1.check_in(@guest1, @room1)
    @karaoke_bar1.check_in(@guest1, @room1)
    @karaoke_bar1.check_in(@guest1, @room1)
    @karaoke_bar1.check_in(@guest1, @room1)

    assert_equal("Capacity limit of 5 reached", @karaoke_bar1.capacity_limit(@room1))
  end

  def test_capacity_limit__remaining
    @karaoke_bar1.check_in(@guest1, @room1)
    @karaoke_bar1.check_in(@guest1, @room1)
    @karaoke_bar1.check_in(@guest1, @room1)

    assert_equal("Remaining capacity: 2", @karaoke_bar1.capacity_limit(@room1))
  end

  def test_capacity_limit__exceeded
    @karaoke_bar1.check_in(@guest1, @room1)
    @karaoke_bar1.check_in(@guest1, @room1)
    @karaoke_bar1.check_in(@guest1, @room1)
    @karaoke_bar1.check_in(@guest1, @room1)
    @karaoke_bar1.check_in(@guest1, @room1)
    @karaoke_bar1.check_in(@guest1, @room1)

    assert_equal("Capacity exceeded by 1", @karaoke_bar1.capacity_limit(@room1))
  end

  def test_take_guests_payment_for_room
    @karaoke_bar1.take_guests_payment_for_room(@guest1, @room3)
    assert_equal(100.00, @karaoke_bar1.till)
    assert_equal(20.00, @guest1.wallet)
  end


end

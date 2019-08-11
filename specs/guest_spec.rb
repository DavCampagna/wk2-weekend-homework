require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../guest")
require_relative("../song")

class TestGuest < Minitest::Test

  def setup
    @song1 = Song.new("I cry in the shower")
    @song2 = Song.new("Smells like bee spirit")
    @song3 = Song.new("I will survive")

    @guest1 = Guest.new("Frannie Vavotici", 80.00, "I will survive")

    @room1 = Room.new("Room 1", 60.00, 5, [], [@song1, @song2, @song3])

  end

  def test_customer_name
    assert_equal("Frannie Vavotici", @guest1.name)
  end

  def test_customer_money
    assert_equal(80.00, @guest1.wallet)
  end

  def test_customer_favourite_song
    assert_equal("I will survive", @guest1.favourite_song)
  end

  def test_pay_for_room
    @guest1.pay_for_room(@room1)
    assert_equal(20.00, @guest1.wallet)
  end

  def test_select_song_from_playlist
    assert_equal(@song2, @guest1.select_song_from_playlist(@song2))
  end

  def test_add_song_to_personal_playlist
    @guest1.add_song_to_personal_playlist(@song1)
    assert_equal([@song1], @guest1.personal_playlist)
  end

  def test_remove_song_from_personal_playlist
    @guest1.add_song_to_personal_playlist(@song1)
    @guest1.add_song_to_personal_playlist(@song2)

    @guest1.remove_song_from_personal_playlist(@song1)
    assert_equal([@song2], @guest1.personal_playlist)
  end

  def test_cheer_to_favourite_song
    @guest1.add_song_to_personal_playlist(@song1)
    @guest1.add_song_to_personal_playlist(@song2)
    @guest1.add_song_to_personal_playlist(@song3)

    assert_equal("Whoo!", @guest1.cheer_to_favourite_song)
  end


end

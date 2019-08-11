require("minitest/autorun")
require("minitest/rg")
require_relative("../song")

class TestSong < Minitest::Test

  def setup
    @song1 = Song.new("I cry in the shower")
  end

  def test_song_name
    assert_equal("I cry in the shower", @song1.name)
  end


end

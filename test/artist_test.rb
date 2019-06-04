require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'
require './lib/artist'
require 'pry'

class ArtistTest < MiniTest::Test
  def setup
    @attributes = {
  id: "2",
  name: "Ansel Adams",
  born: "1902",
  died: "1984",
  country: "United States"
  }

  @artist = Artist.new(@attributes)
  end

  def test_artist_exists
    assert_instance_of Artist, @artist
  end

end

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'
require 'pry'

class PhotographTest < MiniTest::Test
  def setup
    @attributes = {
  id: "1",
  name: "Rue Mouffetard, Paris (Boy with Bottles)",
  artist_id: 4,
  year: 1954}
    @photograph = Photograph.new(@attributes)
  end

  def test_photo_exists
    assert_instance_of Photograph, @photograph
  end

end

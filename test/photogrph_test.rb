require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'

class PhotographTest < MiniTest::Test
  def setup
    @photograph = Photograph.new(attributes)
  end

  def test_photo_exists
    assert_instance_of Photograph, @photograph
  end

end

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'
require './lib/artist'
require './lib/curator'
require 'pry'

class CuratorTest < MiniTest::Test
  def setup
    @curator = Curator.new
  end

  def test_curator_exists
    assert_instance_of Curator, @curator
  end

end

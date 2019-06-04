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

    @photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    @photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }

    @photo_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }

    @photo_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
    }

    @artist_1 = {id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }

    @artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }

    @artist_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
    }
  end

  def test_curator_exists
    assert_instance_of Curator, @curator
  end

  def test_curator_attributes
    assert_equal [], @curator.artists
    assert_equal [], @curator.photographs
  end

  def test_add_photographs
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)
    # binding.pry
    #assert_equal [@photo_1, @photo_2], @curator.photographs
    assert_equal 2, @curator.photographs.length
  end

  def test_add_artists
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    # binding.pry
    assert_equal 2, @curator.artists.length
  end

  def test_find_artist_by_id
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    #binding.pry
    assert_instance_of Artist, @curator.find_artist_by_id("1")
    #assert_equal [@artist_1], @curator.find_artist_by_id("1")
  end

  def test_find_photo_by_id
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)
    assert_instance_of Photograph, @curator.find_photograph_by_id("2")
  end

  def test_find_photos_by_artist_id
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)
    @curator.add_photograph(@photo_3)
    @curator.add_photograph(@photo_4)

    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    @curator.add_artist(@artist_3)
    diane_arbus = @curator.find_artist_by_id("3")
    #binding.pry
    assert_equal [@photo_3, @photo_4], @curator.find_photographs_by_artist(diane_arbus)
  end

  def test_artists_with_multiple_photos
    skip
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)
    @curator.add_photograph(@photo_3)
    @curator.add_photograph(@photo_4)

    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    @curator.add_artist(@artist_3)
    diane_arbus = @curator.find_artist_by_id("3")
    #binding.pry
    assert_equal [diane_arbus], @curator.artists_with_multiple_photographs
  end

  def test_photos_taken_by_artist_from
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)
    @curator.add_photograph(@photo_3)
    @curator.add_photograph(@photo_4)

    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    @curator.add_artist(@artist_3)
    binding.pry
    assert_equal [@photo_2, @photo_3, @photo_4], @curator.photographs_taken_by_artist_from("United States")
    assert_equal [], @curator.photographs_taken_by_artist_from("Argentina")
  end

end

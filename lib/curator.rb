class Curator
  attr_reader :artists, :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photo)
    @photographs << Photograph.new(photo)
  end

  def add_artist(artist)
    @artists << Artist.new(artist)
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      id == artist.id
    end
  end

  def find_photograph_by_id(id)
    @photographs.find do |photo|
      id == photo.id
    end
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photo|
      artist.id == photo.artist_id
    end
  end

  def artists_with_multiple_photographs
    # artist_name = []
    # artistas = []
    # @artists.each do |artist|
    #   artist_name << artist.name
    # end
    # artist_name
  end

end

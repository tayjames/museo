require 'pry'

class Photograph
  attr_reader :attributes, :id, :name, :artist_id, :year

  def initialize(hash)
    @attributes = hash
    @id = @attributes[:id]
    @name = @attributes[:name]
    @artist_id = @attributes[:artist_id]
    @year = @attributes[:year]
  end
end

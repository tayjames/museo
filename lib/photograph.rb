require 'pry'

class Photograph
  attr_reader :attributes

  def initialize(hash)
    @attributes = hash
  end
end

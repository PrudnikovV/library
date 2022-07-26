# frozen_string_literal: true

# This class for reader
class Reader
  include Validation
  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    presence(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  def to_s
    @name
  end
end

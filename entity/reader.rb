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

  def ==(other)
    @name == other.name &&
      @email == other.email &&
      @city == other.city &&
      @street == other.street &&
      @house == other.house
  end
end

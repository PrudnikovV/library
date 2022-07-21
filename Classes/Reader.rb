require "./Module/Validation"

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

  def == other_reader
    @name == other_reader.name &&
    @email == other_reader.email &&
    @city == other_reader.city &&
    @street == other_reader.street &&
    @house == other_reader.house
  end

end

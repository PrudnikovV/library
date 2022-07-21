require "./Module/Validation"
class Reader
  include Validation
  def initialize(name, email, city, street, house)
    presence(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end
end

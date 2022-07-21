require "./Module/Validation"
class Author
  include Validation
  def initialize(name, biography = "")
    presence(name)
    @name = name
    @biography = biography
  end
end

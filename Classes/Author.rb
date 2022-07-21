require_relative "../Module/Validation"

class Author

  include Validation

  def initialize(name, biography="")
    presence(name)
    @name = name
    @biography = biography
  end

  def to_s
    @name
  end

  def ==(other_author)
    @name == other_author.name
  end

end

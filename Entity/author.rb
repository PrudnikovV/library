# frozen_string_literal: true

# Validation module
require_relative '../Module/validation'

# This class for Author
class Author
  include Validation

  def initialize(name, biography = '')
    presence(name)
    @name = name
    @biography = biography
  end

  def to_s
    @name
  end

  def ==(other)
    @name == other.name
  end
end

# frozen_string_literal: true

require_relative '../Module/validation' # Validation module
require_relative 'author' # class author

# This class for book
class Book
  include Validation

  attr_accessor :author
  attr_reader :title

  def initialize(title, author)
    presence(title)
    check_class(author, Author)
    @title = title
    @author = author
  end

  def to_s
    "#{@title} (#{@author})"
  end

  def ==(other)
    @title == other.title &&
      @author == other.author
  end
end

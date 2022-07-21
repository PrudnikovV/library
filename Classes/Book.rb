require_relative "../Module/Validation"
require_relative "Author"

class Book

  include Validation

  attr_accessor :author
  attr_reader :title

  def initialize(title, author)
    presence(title)
    is_a_class(author, Author)
    @title = title
    @author = author
  end

  def to_s
    "#{@title} (#{@author})"
  end

  def ==(other_book)
    @title == other_book.title &&
    @author == other_book.author
 end

end

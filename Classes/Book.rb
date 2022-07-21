require "./Module/Validation"
require "/Author"

class Book
  include Validation
  def initialize(title, author)
    presence(title)
    is_a_class(author, Author)
    @title = title
    @author = author
  end
end

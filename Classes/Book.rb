require "./Module/Validation"
class Book
  include Validation
  def initialize(title, author)
    presence(title, author)
    @title = title
    @author = author
  end
end

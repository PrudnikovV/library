require '/Book'
require '/Reader'

require "./Module/Validation"
Class Order
  include Validation
  def initialize(book, reader, date)
    is_a_class(book, Book)
    is_a_class(reader, Reader)
    is_a_class(date, Date)
    @book = book
    @reader = reader
    @date = date
  end
end

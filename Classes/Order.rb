require_relative 'Book'
require_relative 'Reader'
require 'date'

require_relative "../Module/Validation"
class Order
  include Validation
  def initialize(book, reader, date=Date.today)
    is_a_class(book, Book)
    is_a_class(reader, Reader)
    is_a_class(date, Date)
    @book = book
    @reader = reader
    @date = date
  end
end
